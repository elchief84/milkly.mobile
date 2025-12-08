import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';

/// Photo message bubble for chat history
class PhotoMessageBubble extends StatelessWidget {
  final String photoPath;
  final ThemeVariant variant;

  const PhotoMessageBubble({
    super.key,
    required this.photoPath,
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
              constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(3),
                ),
                border: Border.all(
                  color: AppTheme.getPrimaryColor(variant),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(1),
                ),
                child: Image.file(File(photoPath), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
