import 'package:equatable/equatable.dart';

/// Events for the onboarding flow
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Start loading the questionnaire
class LoadQuestionnaire extends OnboardingEvent {
  const LoadQuestionnaire();
}

/// Answer the current question
class AnswerQuestion extends OnboardingEvent {
  final String questionId;
  final dynamic answer;

  const AnswerQuestion({
    required this.questionId,
    required this.answer,
  });

  @override
  List<Object?> get props => [questionId, answer];
}

/// Confirm answer and move to next question
class ConfirmAnswer extends OnboardingEvent {
  const ConfirmAnswer();
}

/// Move to previous question
class PreviousQuestion extends OnboardingEvent {
  const PreviousQuestion();
}

/// Complete onboarding
class CompleteOnboarding extends OnboardingEvent {
  const CompleteOnboarding();
}

