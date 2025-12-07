import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/theme/chat_theme.dart';

class ChatOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFemale;

  const ChatOptionButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.isFemale = true,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = ChatTheme.getPrimaryColor(isFemale: isFemale);
    final primaryLight = ChatTheme.getPrimaryPaleColor(isFemale: isFemale);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: primaryLight,
        highlightColor: primaryLight,
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? primaryLight : Colors.transparent,
            border: Border.all(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? primaryColor
                  : ChatTheme.getPrimaryColor(isFemale: isFemale),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatOptionsContainer extends StatelessWidget {
  final List<Widget> children;

  const ChatOptionsContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(spacing: 8, runSpacing: 8, children: children),
    );
  }
}
