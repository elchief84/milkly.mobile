import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/core/utils/l10n_helper.dart';

class ChatConfirmButton extends StatelessWidget {
  final VoidCallback onConfirm;
  final bool enabled;
  final ThemeVariant variant;

  const ChatConfirmButton({
    super.key,
    required this.onConfirm,
    this.enabled = true,
    this.variant = ThemeVariant.neutral,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: enabled ? onConfirm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.getPrimaryColor(variant),
            foregroundColor: AppTheme.white,
            disabledBackgroundColor: AppTheme.textHintColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.commonConfirm,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: enabled ? AppTheme.white : AppTheme.textHintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
