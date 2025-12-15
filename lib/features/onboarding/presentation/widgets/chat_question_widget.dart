import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/features/onboarding/data/models/questionnaire_model.dart';
import 'package:smart_breastfeeding/features/onboarding/domain/entities/question_type.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_message_bubble.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_option_button.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_input_field.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_confirm_button.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/widgets/chat_photo_input.dart';
import 'package:smart_breastfeeding/core/utils/l10n_helper.dart';

class ChatQuestionWidget extends StatelessWidget {
  final QuestionModel question;
  final String? questionTitle; // Optional interpolated title
  final dynamic currentAnswer;
  final Function(dynamic) onAnswerChanged;
  final VoidCallback? onConfirm;
  final ThemeVariant variant;

  const ChatQuestionWidget({
    super.key,
    required this.question,
    this.questionTitle,
    required this.currentAnswer,
    required this.onAnswerChanged,
    this.onConfirm,
    this.variant = ThemeVariant.neutral,
  });

  /// Get the effective title (interpolated if provided, otherwise original)
  String get _effectiveTitle => questionTitle ?? question.title;

  @override
  Widget build(BuildContext context) {
    final questionType = QuestionType.fromString(question.type);

    switch (questionType) {
      case QuestionType.singleChoice:
        return _buildSingleChoice(context);
      case QuestionType.multipleChoice:
        return _buildMultipleChoice(context);
      case QuestionType.photo:
        return _buildPhotoInput(context);
      case QuestionType.text:
      case QuestionType.number:
      case QuestionType.date:
      case QuestionType.time:
        return _buildInputField(context, questionType);
    }
  }

  Widget _buildSingleChoice(BuildContext context) {
    return Column(
      children: [
        AssistantMessageBubble(
          message: _effectiveTitle,
          showAvatar: true,
          variant: variant,
        ),
        const SizedBox(height: 12),
        ChatOptionsContainer(
          children: question.options!.map((option) {
            final isSelected = currentAnswer == option.id;
            return ChatOptionButton(
              text: option.text,
              isSelected: isSelected,
              variant: variant,
              onTap: () => onAnswerChanged(option.id),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMultipleChoice(BuildContext context) {
    final selectedOptions = (currentAnswer as List?) ?? [];

    return Column(
      children: [
        AssistantMessageBubble(
          message: _effectiveTitle,
          showAvatar: true,
          variant: variant,
        ),
        const SizedBox(height: 12),
        ChatOptionsContainer(
          children: question.options!.map((option) {
            final isSelected = selectedOptions.contains(option.id);
            return ChatOptionButton(
              text: option.text,
              isSelected: isSelected,
              variant: variant,
              onTap: () {
                final updated = List.from(selectedOptions);
                if (isSelected) {
                  updated.remove(option.id);
                } else {
                  updated.add(option.id);
                }
                onAnswerChanged(updated);
              },
            );
          }).toList(),
        ),
        if (selectedOptions.isNotEmpty && onConfirm != null) ...[
          const SizedBox(height: 16),
          ChatConfirmButton(
            onConfirm: onConfirm!,
            enabled: true,
            variant: variant,
          ),
        ],
      ],
    );
  }

  Widget _buildPhotoInput(BuildContext context) {
    final hasPhoto =
        currentAnswer != null && currentAnswer.toString().isNotEmpty;
    final isRequired = question.required;

    return Column(
      children: [
        AssistantMessageBubble(
          message: _effectiveTitle,
          showAvatar: true,
          variant: variant,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ChatPhotoInput(
            initialValue: currentAnswer?.toString(),
            onPhotoSelected: (photoPath) {
              onAnswerChanged(photoPath);
              // Auto-confirm is handled by parent widget
            },
            variant: variant,
          ),
        ),
        // Show skip button if not required and no photo selected yet
        if (!isRequired && !hasPhoto && onConfirm != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Skip by setting empty value - auto-confirm is handled by parent
                  onAnswerChanged('');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.getPrimaryColor(variant),
                  side: BorderSide(
                    color: AppTheme.getPrimaryColor(variant),
                    width: 2,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.commonSkip,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getPrimaryColor(variant),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: AppTheme.getPrimaryColor(variant),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputField(BuildContext context, QuestionType questionType) {
    return Column(
      children: [
        AssistantMessageBubble(
          message: _effectiveTitle,
          showAvatar: true,
          variant: variant,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildInputWidget(context, questionType),
        ),
      ],
    );
  }

  TimeOfDay _parseTimeOfDay(String timeString) {
    try {
      final parts = timeString.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    } catch (_) {
      return TimeOfDay.now();
    }
  }

  Widget _buildInputWidget(BuildContext context, QuestionType questionType) {
    switch (questionType) {
      case QuestionType.text:
        return ChatInputField(
          placeholder:
              question.placeholder ?? context.l10n.onboardingTextPlaceholder,
          initialValue: currentAnswer?.toString(),
          onSend: onAnswerChanged,
          variant: variant,
        );

      case QuestionType.number:
        return ChatInputField(
          placeholder:
              question.placeholder ?? context.l10n.onboardingNumberPlaceholder,
          keyboardType: TextInputType.number,
          initialValue: currentAnswer?.toString(),
          onSend: (value) {
            final number = int.tryParse(value);
            if (number != null) onAnswerChanged(number);
          },
          variant: variant,
        );

      case QuestionType.date:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (date != null) onAnswerChanged(date.toIso8601String());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.getSurfaceColor(variant),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: currentAnswer != null
                      ? AppTheme.getPrimaryColor(variant)
                      : AppTheme.textHintColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentAnswer != null
                        ? currentAnswer.toString().split('T')[0]
                        : context.l10n.onboardingSelectDate,
                    style: TextStyle(
                      color: currentAnswer != null
                          ? AppTheme.getPrimaryColor(variant)
                          : AppTheme.neutralTextHintColor,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: currentAnswer != null
                        ? AppTheme.getPrimaryColor(variant)
                        : AppTheme.neutralTextHintColor,
                  ),
                ],
              ),
            ),
          ),
        );

      case QuestionType.time:
        return InkWell(
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: currentAnswer != null
                  ? _parseTimeOfDay(currentAnswer.toString())
                  : TimeOfDay.now(),
            );
            if (time != null) {
              onAnswerChanged(
                '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: currentAnswer != null
                    ? AppTheme.getPrimaryColor(variant)
                    : AppTheme.textHintColor,
                width: currentAnswer != null ? 2 : 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentAnswer != null
                      ? currentAnswer.toString()
                      : context.l10n.onboardingSelectTime,
                  style: TextStyle(
                    color: currentAnswer != null
                        ? AppTheme.textDarkPrimary
                        : AppTheme.textHintColor,
                  ),
                ),
                const Icon(
                  Icons.access_time,
                  color: AppTheme.textDarkSecondary,
                ),
              ],
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
