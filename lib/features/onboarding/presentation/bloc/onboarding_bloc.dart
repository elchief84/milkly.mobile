import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_breastfeeding/features/onboarding/data/datasources/questionnaire_datasource.dart';
import 'package:smart_breastfeeding/features/onboarding/data/models/questionnaire_model.dart';
import 'package:smart_breastfeeding/features/onboarding/domain/entities/question_type.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:smart_breastfeeding/l10n/app_localizations.dart';

/// Bloc for managing onboarding flow
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final QuestionnaireDatasource _datasource;
  final AppLocalizations l10n;

  OnboardingBloc({required this.l10n, QuestionnaireDatasource? datasource})
    : _datasource = datasource ?? QuestionnaireDatasource(),
      super(const OnboardingInitial()) {
    on<LoadQuestionnaire>(_onLoadQuestionnaire);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<ConfirmAnswer>(_onConfirmAnswer);
    on<PreviousQuestion>(_onPreviousQuestion);
    on<CompleteOnboarding>(_onCompleteOnboarding);
  }

  Future<void> _onLoadQuestionnaire(
    LoadQuestionnaire event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(const OnboardingLoading());

    try {
      // Load questionnaire with the current locale
      final questionnaire = await _datasource.loadQuestionnaire(
        locale: l10n.localeName,
      );
      emit(
        OnboardingReady(
          questionnaire: questionnaire,
          currentStepIndex: 0,
          currentQuestionIndex: 0,
          answers: {},
        ),
      );
    } catch (e) {
      emit(OnboardingError(l10n.onboardingLoadError(e.toString())));
    }
  }

  void _onAnswerQuestion(AnswerQuestion event, Emitter<OnboardingState> emit) {
    if (state is! OnboardingReady) return;

    final currentState = state as OnboardingReady;
    final updatedAnswers = Map<String, dynamic>.from(currentState.answers);
    updatedAnswers[event.questionId] = event.answer;

    emit(currentState.copyWith(answers: updatedAnswers));
  }

  void _onConfirmAnswer(ConfirmAnswer event, Emitter<OnboardingState> emit) {
    if (state is! OnboardingReady) return;

    final currentState = state as OnboardingReady;

    // Add current question and answer to chat history
    final currentQuestion = currentState.currentQuestion;
    final answer = currentState.answers[currentQuestion.id];

    final updatedHistory = List<ChatMessage>.from(currentState.chatHistory);
    updatedHistory.add(
      ChatMessage(
        questionId: currentQuestion.id,
        questionText:
            currentState.currentQuestionTitle, // Use interpolated title
        questionType: currentQuestion.type, // Add question type
        answer: answer,
        answerText: _getAnswerDisplayText(currentQuestion, answer),
      ),
    );

    // Find next visible question
    int nextQuestionIndex = currentState.currentQuestionIndex + 1;
    int nextStepIndex = currentState.currentStepIndex;

    // If we're at the end of current step, move to next step
    if (nextQuestionIndex >= currentState.currentStep.questions.length) {
      if (currentState.isLastStep) {
        // Completed all steps
        emit(currentState.copyWith(chatHistory: updatedHistory));
        add(const CompleteOnboarding());
        return;
      }
      nextStepIndex++;
      nextQuestionIndex = 0;
    }

    // Skip questions that shouldn't be shown based on conditional logic
    while (nextStepIndex < currentState.questionnaire.steps.length) {
      final step = currentState.questionnaire.steps[nextStepIndex];
      while (nextQuestionIndex < step.questions.length) {
        final question = step.questions[nextQuestionIndex];
        if (currentState.shouldShowQuestion(question)) {
          emit(
            currentState.copyWith(
              currentStepIndex: nextStepIndex,
              currentQuestionIndex: nextQuestionIndex,
              chatHistory: updatedHistory,
            ),
          );
          return;
        }
        nextQuestionIndex++;
      }
      nextStepIndex++;
      nextQuestionIndex = 0;
    }

    // If we got here, we've completed the questionnaire
    emit(currentState.copyWith(chatHistory: updatedHistory));
    add(const CompleteOnboarding());
  }

  void _onPreviousQuestion(
    PreviousQuestion event,
    Emitter<OnboardingState> emit,
  ) {
    if (state is! OnboardingReady) return;

    final currentState = state as OnboardingReady;

    int prevQuestionIndex = currentState.currentQuestionIndex - 1;
    int prevStepIndex = currentState.currentStepIndex;

    // If we're at the beginning of current step, move to previous step
    if (prevQuestionIndex < 0) {
      if (prevStepIndex == 0) return; // Already at the beginning

      prevStepIndex--;
      final prevStep = currentState.questionnaire.steps[prevStepIndex];
      prevQuestionIndex = prevStep.questions.length - 1;
    }

    emit(
      currentState.copyWith(
        currentStepIndex: prevStepIndex,
        currentQuestionIndex: prevQuestionIndex,
      ),
    );
  }

  void _onCompleteOnboarding(
    CompleteOnboarding event,
    Emitter<OnboardingState> emit,
  ) {
    if (state is! OnboardingReady) return;

    final currentState = state as OnboardingReady;
    emit(OnboardingCompleted(currentState.answers, currentState.questionnaire));
  }

  String _getAnswerDisplayText(QuestionModel question, dynamic answer) {
    if (answer == null) return '';

    final questionType = QuestionType.fromString(question.type);

    switch (questionType) {
      case QuestionType.singleChoice:
        final answerId = answer as String;
        final option = question.options?.firstWhere(
          (opt) => opt.id == answerId,
        );
        return option?.text ?? answerId;
      case QuestionType.multipleChoice:
        final answerIds = answer as List;
        return answerIds
            .map((answerId) {
              final option = question.options?.firstWhere(
                (opt) => opt.id == answerId,
              );
              return option?.text ?? answerId.toString();
            })
            .join(', ');
      case QuestionType.photo:
        return answer.toString().isNotEmpty ? l10n.onboardingPhotoUploadedLabel : '';
      case QuestionType.text:
      case QuestionType.number:
        return answer.toString();
      case QuestionType.date:
        return answer.toString().split('T')[0];
      case QuestionType.time:
        return answer.toString();
    }
  }
}
