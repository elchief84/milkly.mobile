import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/chat_theme.dart';

class ChatConfirmButton extends StatelessWidget {
  final VoidCallback onConfirm;
  final bool enabled;
  final bool isFemale;

  const ChatConfirmButton({
    super.key,
    required this.onConfirm,
    this.enabled = true,
    this.isFemale = true,
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
            backgroundColor: ChatTheme.getPrimaryColor(isFemale: isFemale),
            foregroundColor: ChatTheme.white,
            disabledBackgroundColor: ChatTheme.textHint,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            elevation: 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Conferma', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18, color: enabled ? ChatTheme.white : ChatTheme.textHint),
            ],
          ),
        ),
      ),
    );
  }
}

