import 'package:flutter/material.dart';

/// Chat theme for onboarding chatbot (gender-based variants)
class ChatTheme {
  ChatTheme._();

  // Female variant colors (from mockup)
  static const Color femalePrimary = Color(0xFFF5A4C6);
  static const Color femalePrimaryLight = Color(0xFFFCE4EC);
  static const Color femalePrimaryPale = Color(0xFFFFF0F5);

  // Common colors
  static const Color assistantBubbleBackground = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color white = Colors.white;

  static Color getPrimaryColor({required bool isFemale}) => femalePrimary;
  static Color getPrimaryLightColor({required bool isFemale}) =>
      femalePrimaryLight;
  static Color getPrimaryPaleColor({required bool isFemale}) =>
      femalePrimaryPale;
}
