import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';
import 'package:smart_breastfeeding/core/theme/chat_theme.dart';
import 'package:smart_breastfeeding/core/utils/l10n_helper.dart';
import 'package:smart_breastfeeding/core/utils/theme_extensions.dart';
import 'package:smart_breastfeeding/features/onboarding/domain/entities/question_type.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_message_bubble.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_question_widget.dart';

/// Onboarding page - guided chatbot flow for initial setup
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc()..add(const LoadQuestionnaire()),
      child: const _OnboardingContent(),
    );
  }
}

class _OnboardingContent extends StatefulWidget {
  const _OnboardingContent();

  @override
  State<_OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<_OnboardingContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: SafeArea(
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            // Auto-scroll when state changes to show new question or completion
            if (state is OnboardingReady || state is OnboardingCompleted) {
              _scrollToBottom();
            }
          },
          builder: (context, state) {
            if (state is OnboardingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is OnboardingError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            if (state is OnboardingCompleted) {
              return _buildCompletionView(context, state);
            }

            if (state is OnboardingReady) {
              return _buildChatbotView(context, state);
            }

            // Initial state - show welcome
            return _buildWelcomeView(context);
          },
        ),
      ),
    );
  }

  Widget _buildWelcomeView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.waving_hand,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 32),
          Text(
            context.l10n.welcomeToMilkly,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.onboardingSubtitle,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () =>
                context.read<OnboardingBloc>().add(const LoadQuestionnaire()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Text(context.l10n.getStarted),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatbotView(BuildContext context, OnboardingReady state) {
    return Container(
      color: context.colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressBar(context, state),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            // Welcome message
                            AssistantMessageBubble(
                              message: context.l10n.onboardingSubtitle,
                              showAvatar: true,
                            ),
                            const SizedBox(height: 16),

                            // Chat history - all previous Q&A
                            ..._buildChatHistory(context, state),

                            // Current question
                            ChatQuestionWidget(
                              question: state.currentQuestion,
                              currentAnswer:
                                  state.answers[state.currentQuestion.id],
                              isFemale: true,
                              onAnswerChanged: (answer) {
                                context.read<OnboardingBloc>().add(
                                  AnswerQuestion(
                                    questionId: state.currentQuestion.id,
                                    answer: answer,
                                  ),
                                );

                                // Auto-confirm for single choice and input fields
                                final questionType = QuestionType.fromString(
                                  state.currentQuestion.type,
                                );
                                if (questionType == QuestionType.singleChoice ||
                                    questionType == QuestionType.text ||
                                    questionType == QuestionType.number ||
                                    questionType == QuestionType.date ||
                                    questionType == QuestionType.time) {
                                  Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () {
                                      if (context.mounted) {
                                        context.read<OnboardingBloc>().add(
                                          const ConfirmAnswer(),
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                              onConfirm: () {
                                context.read<OnboardingBloc>().add(
                                  const ConfirmAnswer(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChatHistory(BuildContext context, OnboardingReady state) {
    return state.chatHistory.expand((message) {
      return [
        AssistantMessageBubble(message: message.questionText, showAvatar: true),
        const SizedBox(height: 12),
        if (message.answerText != null && message.answerText!.isNotEmpty)
          UserMessageBubble(message: message.answerText!, isFemale: true),
        const SizedBox(height: 16),
      ];
    }).toList();
  }

  Widget _buildProgressBar(BuildContext context, OnboardingReady state) {
    final progress =
        (state.currentStepIndex + 1) / state.questionnaire.steps.length;
    return Container(
      color: ChatTheme.white,
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: ChatTheme.femalePrimaryLight,
        valueColor: const AlwaysStoppedAnimation<Color>(
          ChatTheme.femalePrimary,
        ),
      ),
    );
  }

  Widget _buildCompletionView(BuildContext context, OnboardingCompleted state) {
    // Get the last state to access chat history
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, currentState) {
        final OnboardingReady? readyState = currentState is OnboardingReady
            ? currentState
            : null;

        return Container(
          color: ChatTheme.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            // Welcome message
                            AssistantMessageBubble(
                              message: context.l10n.onboardingSubtitle,
                              showAvatar: true,
                            ),
                            const SizedBox(height: 16),

                            // Show ALL chat history
                            if (readyState != null)
                              ..._buildChatHistory(context, readyState),

                            // Final confirmation message
                            const SizedBox(height: 8),
                            AssistantMessageBubble(
                              message:
                                  'Perfetto! Ora posso creare il tuo piano di allattamento personalizzato.',
                              showAvatar: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: ChatTheme.white,
                padding: const EdgeInsets.all(16),
                child: SafeArea(
                  top: false,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _completeOnboarding(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ChatTheme.femalePrimary,
                        foregroundColor: ChatTheme.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Crea il mio piano',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool(AppConstants.keyOnboardingCompleted, true);

    if (context.mounted) {
      context.go(AppRoutes.home);
    }
  }
}
