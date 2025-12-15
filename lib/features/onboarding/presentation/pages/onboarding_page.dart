import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/core/theme/theme_cubit.dart';
import 'package:smart_breastfeeding/core/utils/l10n_helper.dart';
import 'package:smart_breastfeeding/core/utils/theme_extensions.dart';
import 'package:smart_breastfeeding/features/onboarding/domain/entities/question_type.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_message_bubble.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_photo_bubble.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_question_widget.dart';

/// Onboarding page - guided chatbot flow for initial setup
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  OnboardingBloc? _bloc;
  String? _localeName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final localeName = context.l10n.localeName;
    if (_bloc != null && _localeName == localeName) return;

    final previousBloc = _bloc;
    if (previousBloc != null) {
      unawaited(previousBloc.close());
    }

    _localeName = localeName;
    _bloc = OnboardingBloc(l10n: context.l10n)..add(const LoadQuestionnaire());
  }

  @override
  void dispose() {
    final bloc = _bloc;
    if (bloc != null) {
      unawaited(bloc.close());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = _bloc;
    if (bloc == null) {
      return const SizedBox.shrink();
    }

    return BlocProvider.value(value: bloc, child: const _OnboardingContent());
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
            _scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Set default theme to neutral at start
    context.read<ThemeCubit>().setThemeFromChildSex('other');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        title: Text(context.l10n.onboardingStartTitle),
      ),
      body: SafeArea(
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            // Navigate to review page when onboarding is completed
            if (state is OnboardingCompleted) {
              context.push(
                AppRoutes.onboardingReview,
                extra: {
                  'answers': state.answers,
                  'questionnaire': state.questionnaire,
                },
              );
            }
            // Auto-scroll when state changes to show new question
            if (state is OnboardingReady) {
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
              // Show loading while navigating to review page
              return const Center(child: CircularProgressIndicator());
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
    // Get current theme variant
    final currentTheme = context.watch<ThemeCubit>().state;

    return Container(
      color: context.colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressBar(context, state),
          Expanded(
            child: ListView(
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.only(top: 24),
              children: [
                // Current question
                ChatQuestionWidget(
                  question: state.currentQuestion,
                  questionTitle: state.currentQuestionTitle,
                  currentAnswer: state.answers[state.currentQuestion.id],
                  variant: currentTheme,
                  onAnswerChanged: (answer) {
                    context.read<OnboardingBloc>().add(
                      AnswerQuestion(
                        questionId: state.currentQuestion.id,
                        answer: answer,
                      ),
                    );

                    // Change theme if this is the childSex question
                    if (state.currentQuestion.id == 'childSex') {
                      context.read<ThemeCubit>().setThemeFromChildSex(
                        answer as String,
                      );
                    }

                    // Auto-confirm for single choice, photo and input fields
                    final questionType = QuestionType.fromString(
                      state.currentQuestion.type,
                    );
                    if (questionType == QuestionType.singleChoice ||
                        questionType == QuestionType.photo ||
                        questionType == QuestionType.text ||
                        questionType == QuestionType.number ||
                        questionType == QuestionType.date ||
                        questionType == QuestionType.time) {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        if (context.mounted) {
                          context.read<OnboardingBloc>().add(
                            const ConfirmAnswer(),
                          );
                        }
                      });
                    }
                  },
                  onConfirm: () {
                    context.read<OnboardingBloc>().add(const ConfirmAnswer());
                  },
                ),
                const SizedBox(height: 16),

                // Chat history - all previous Q&A (newest first; ListView is reversed)
                ..._buildChatHistory(context, state, currentTheme),

                const SizedBox(height: 16),

                // Welcome message (top of the chat)
                AssistantMessageBubble(
                  message: context.l10n.onboardingChatWelcomeMessage,
                  showAvatar: true,
                  variant: currentTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChatHistory(
    BuildContext context,
    OnboardingReady state,
    ThemeVariant currentTheme,
  ) {
    return state.chatHistory.reversed.map((message) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AssistantMessageBubble(
            message: message.questionText,
            showAvatar: true,
            variant: currentTheme,
          ),
          const SizedBox(height: 12),
          if (message.answerText != null && message.answerText!.isNotEmpty)
            // Show photo bubble for photo questions, text bubble for others
            message.questionType == 'photo' &&
                    message.answer != null &&
                    message.answer.toString().isNotEmpty
                ? PhotoMessageBubble(
                    photoPath: message.answer.toString(),
                    variant: currentTheme,
                  )
                : UserMessageBubble(
                    message: message.answerText!,
                    variant: currentTheme,
                  ),
          const SizedBox(height: 16),
        ],
      );
    }).toList();
  }

  Widget _buildProgressBar(BuildContext context, OnboardingReady state) {
    final currentTheme = context.watch<ThemeCubit>().state;
    final progress =
        (state.currentStepIndex + 1) / state.questionnaire.steps.length;
    return Container(
      color: AppTheme.white,
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: AppTheme.getPrimaryLightColor(currentTheme),
        valueColor: AlwaysStoppedAnimation<Color>(
          AppTheme.getPrimaryColor(currentTheme),
        ),
      ),
    );
  }
}
