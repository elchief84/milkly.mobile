import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/chat_theme.dart';

class AssistantMessageBubble extends StatelessWidget {
  final String message;
  final bool showAvatar;

  const AssistantMessageBubble({
    super.key,
    required this.message,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 60, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar) ...[
            CircleAvatar(
              radius: 18,
              backgroundColor: ChatTheme.femalePrimaryLight,
              child: const Icon(
                Icons.person,
                size: 20,
                color: ChatTheme.femalePrimary,
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
                      color: ChatTheme.textSecondary,
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
                    color: ChatTheme.femalePrimaryLight,
                    borderRadius: BorderRadius.only(
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
                      color: ChatTheme.textPrimary,
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
  final bool isFemale;

  const UserMessageBubble({
    super.key,
    required this.message,
    this.isFemale = true,
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
                color: ChatTheme.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: ChatTheme.getPrimaryColor(isFemale: isFemale),
                borderRadius: BorderRadius.only(
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
                  color: ChatTheme.white,
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
