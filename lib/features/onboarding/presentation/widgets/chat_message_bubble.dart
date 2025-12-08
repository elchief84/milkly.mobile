import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';

class AssistantMessageBubble extends StatelessWidget {
  final String message;
  final bool showAvatar;
  final ThemeVariant variant;

  const AssistantMessageBubble({
    super.key,
    required this.message,
    this.showAvatar = true,
    this.variant = ThemeVariant.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 60, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showAvatar) ...[
            CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.getPrimaryLightColor(variant),
              child: Icon(
                Icons.person,
                size: 20,
                color: AppTheme.getPrimaryColor(variant),
              ),
            ),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 44),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showAvatar) ...[
                  const Text(
                    'Assistente',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppTheme.textDarkSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.getPrimaryLightColor(variant),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.textDarkPrimary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserMessageBubble extends StatelessWidget {
  final String message;
  final ThemeVariant variant;

  const UserMessageBubble({
    super.key,
    required this.message,
    this.variant = ThemeVariant.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 16, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Tu',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textDarkSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.getPrimaryColor(variant),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(3),
                ),
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.white,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
