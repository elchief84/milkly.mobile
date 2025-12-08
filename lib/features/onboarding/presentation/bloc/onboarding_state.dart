import 'package:equatable/equatable.dart';
import 'package:smart_breastfeeding/features/onboarding/data/models/questionnaire_model.dart';

/// State for the onboarding flow
abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

/// Initial state - loading questionnaire
class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

/// Loading questionnaire from assets
class OnboardingLoading extends OnboardingState {
  const OnboardingLoading();
}

/// Chat message entry for history
class ChatMessage {
  final String questionId;
  final String questionText;
  final String questionType; // Type of question (text, photo, etc.)
  final dynamic answer;
  final String? answerText;

  const ChatMessage({
    required this.questionId,
    required this.questionText,
    required this.questionType,
    this.answer,
    this.answerText,
  });
}

/// Questionnaire loaded, ready to start
class OnboardingReady extends OnboardingState {
  final QuestionnaireModel questionnaire;
  final int currentStepIndex;
  final int currentQuestionIndex;
  final Map<String, dynamic> answers;
  final List<ChatMessage> chatHistory;

  const OnboardingReady({
    required this.questionnaire,
    this.currentStepIndex = 0,
    this.currentQuestionIndex = 0,
    this.answers = const {},
    this.chatHistory = const [],
  });

  @override
  List<Object?> get props => [
    questionnaire,
    currentStepIndex,
    currentQuestionIndex,
    answers,
    chatHistory,
  ];

  StepModel get currentStep => questionnaire.steps[currentStepIndex];

  QuestionModel get currentQuestion =>
      currentStep.questions[currentQuestionIndex];

  /// Get current question title with interpolated variables
  String get currentQuestionTitle => interpolateText(currentQuestion.title);

  bool get isLastQuestionInStep =>
      currentQuestionIndex >= currentStep.questions.length - 1;

  bool get isLastStep => currentStepIndex >= questionnaire.steps.length - 1;

  bool get isQuestionAnswered => answers.containsKey(currentQuestion.id);

  /// Interpolate variables in a text string
  /// Replaces {questionId} with the answer value
  /// Example: "Hello {childName}!" -> "Hello Sofia!"
  String interpolateText(String text) {
    var result = text;

    // Find all placeholders in format {questionId}
    final regex = RegExp(r'\{(\w+)\}');
    final matches = regex.allMatches(text);

    for (final match in matches) {
      final questionId = match.group(1);
      if (questionId != null && answers.containsKey(questionId)) {
        final value = answers[questionId];
        if (value != null) {
          result = result.replaceAll('{$questionId}', value.toString());
        }
      }
    }

    return result;
  }

  /// Check if a question should be shown based on visibility condition
  bool shouldShowQuestion(QuestionModel question) {
    if (question.visibilityCondition == null) return true;

    final condition = question.visibilityCondition!;
    final questionId = condition['questionId'] as String?;
    final operator = condition['operator'] as String?;
    final value = condition['value'];

    if (questionId == null || operator == null) return true;

    final fieldValue = answers[questionId];

    switch (operator) {
      case 'equals':
        return fieldValue == value;
      case 'notEquals':
        return fieldValue != value;
      case 'in':
        if (value is List) {
          return value.contains(fieldValue);
        }
        return false;
      default:
        return true;
    }
  }

  OnboardingReady copyWith({
    QuestionnaireModel? questionnaire,
    int? currentStepIndex,
    int? currentQuestionIndex,
    Map<String, dynamic>? answers,
    List<ChatMessage>? chatHistory,
  }) {
    return OnboardingReady(
      questionnaire: questionnaire ?? this.questionnaire,
      currentStepIndex: currentStepIndex ?? this.currentStepIndex,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      answers: answers ?? this.answers,
      chatHistory: chatHistory ?? this.chatHistory,
    );
  }
}

/// Error loading questionnaire
class OnboardingError extends OnboardingState {
  final String message;

  const OnboardingError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Onboarding completed
class OnboardingCompleted extends OnboardingState {
  final Map<String, dynamic> answers;

  const OnboardingCompleted(this.answers);

  @override
  List<Object?> get props => [answers];
}
