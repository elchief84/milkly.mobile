import 'package:flutter/material.dart';

/// Extension on BuildContext for easy access to theme properties
extension ThemeExtension on BuildContext {
  /// Access the current ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Access the current TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Access the full Theme
  ThemeData get theme => Theme.of(this);
}

