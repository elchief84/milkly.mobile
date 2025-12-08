import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Theme variant for the entire app (affects both global theme and chat interface)
enum ThemeVariant { neutral, girl, boy }

/// Application theme configuration
class AppTheme {
  AppTheme._();

  // Neutral Theme Colors (default, before gender selection)
  static const Color neutralPrimaryColor = Color(0xFF8FBC8F);
  static const Color neutralSecondaryColor = Color(0xFFD4B896);
  static const Color neutralBackgroundColor = Color(0xFFFAF9F6);
  static const Color neutralSurfaceColor = Color(0xFFEBE8E0);

  // Girl Theme Colors
  static const Color girlPrimaryColor = Color(0xFFF4ABC4);
  static const Color girlSecondaryColor = Color(0xFFF4A5AE);
  static const Color girlBackgroundColor = Color(0xFFFFF6F8);
  static const Color girlSurfaceColor = Color(0xFFFFEBF1);

  // Boy Theme Colors
  static const Color boyPrimaryColor = Color(0xFF5DB0B8);
  static const Color boySecondaryColor = Color(0xFF7BC9CF);
  static const Color boyBackgroundColor = Color(0xFFF5FAFB);
  static const Color boySurfaceColor = Color(0xFFD7F0F3);

  // Common Colors
  static const Color errorColor = Color(0xFFE57373);
  static const Color successColor = Color(0xFF81C784);

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF2D4A50);
  static const Color textSecondaryColor = Color(0xFF6B8B92);
  static const Color textHintColor = Color(0xFFABBDBF);

  // Neutral Theme Text Colors
  static const Color neutralTextPrimaryColor = Color(0xFF3E4A3D);
  static const Color neutralTextSecondaryColor = Color(0xFF6B7469);
  static const Color neutralTextHintColor = Color(0xFFAFB3AD);

  // Common UI Colors (used across all themes)
  static const Color white = Colors.white;
  static const Color textDarkPrimary = Color(0xFF2D2D2D);
  static const Color textDarkSecondary = Color(0xFF757575);
  static const Color surfaceWhite = Color(0xFFFAFAFA);
  static const Color assistantBubbleGrey = Color(0xFFF5F5F5);

  /// Get primary color for a theme variant
  static Color getPrimaryColor(ThemeVariant variant) {
    switch (variant) {
      case ThemeVariant.neutral:
        return neutralPrimaryColor;
      case ThemeVariant.girl:
        return girlPrimaryColor;
      case ThemeVariant.boy:
        return boyPrimaryColor;
    }
  }

  /// Get light variant of primary color for a theme variant
  static Color getPrimaryLightColor(ThemeVariant variant) {
    switch (variant) {
      case ThemeVariant.neutral:
        return const Color(0xFFD4E5D4); // Lighter sage green
      case ThemeVariant.girl:
        return const Color(0xFFFCE4EC); // Light pink
      case ThemeVariant.boy:
        return boySurfaceColor; // Light teal
    }
  }

  /// Get pale/very light variant of primary color for a theme variant
  static Color getPrimaryPaleColor(ThemeVariant variant) {
    switch (variant) {
      case ThemeVariant.neutral:
        return const Color(0xFFEBF2EB); // Very pale sage
      case ThemeVariant.girl:
        return const Color(0xFFFFF0F5); // Very pale pink
      case ThemeVariant.boy:
        return const Color(0xFFEBF8F9); // Very pale teal
    }
  }

  /// Get the ThemeData for a specific variant
  static ThemeData getThemeForVariant(ThemeVariant variant) {
    switch (variant) {
      case ThemeVariant.neutral:
        return lightNeutralTheme;
      case ThemeVariant.girl:
        return lightGirlTheme;
      case ThemeVariant.boy:
        return lightBoyTheme;
    }
  }

  static ThemeData get lightNeutralTheme {
    final baseTextTheme = GoogleFonts.lexendTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: neutralPrimaryColor,
        secondary: neutralSecondaryColor,
        surface: neutralBackgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: neutralBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: neutralSurfaceColor,
        foregroundColor: neutralTextPrimaryColor,
        iconTheme: const IconThemeData(color: neutralTextPrimaryColor),
        titleTextStyle: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: neutralTextPrimaryColor,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: neutralSurfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: neutralSurfaceColor,
        hintStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: neutralTextHintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: neutralTextHintColor.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: neutralPrimaryColor, width: 2),
        ),
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.lexend(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: neutralTextPrimaryColor,
        ),
        displayMedium: GoogleFonts.lexend(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: neutralTextPrimaryColor,
        ),
        displaySmall: GoogleFonts.lexend(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: neutralTextPrimaryColor,
        ),
        headlineMedium: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: neutralTextPrimaryColor,
        ),
        titleLarge: GoogleFonts.lexend(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: neutralTextPrimaryColor,
        ),
        bodyLarge: GoogleFonts.lexend(
          fontSize: 16,
          color: neutralTextPrimaryColor,
        ),
        bodyMedium: GoogleFonts.lexend(
          fontSize: 14,
          color: neutralTextSecondaryColor,
        ),
        bodySmall: GoogleFonts.lexend(
          fontSize: 12,
          color: neutralTextSecondaryColor,
        ),
      ),
    );
  }

  static ThemeData get lightGirlTheme {
    final baseTextTheme = GoogleFonts.lexendTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: girlPrimaryColor,
        secondary: girlSecondaryColor,
        surface: girlBackgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: girlBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: girlSurfaceColor,
        foregroundColor: textPrimaryColor,
        iconTheme: const IconThemeData(color: textPrimaryColor),
        titleTextStyle: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: girlSurfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: girlSurfaceColor,
        hintStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textHintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textHintColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: girlPrimaryColor, width: 2),
        ),
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.lexend(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
        displayMedium: GoogleFonts.lexend(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
        displaySmall: GoogleFonts.lexend(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
        headlineMedium: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
        titleLarge: GoogleFonts.lexend(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textPrimaryColor,
        ),
        bodyLarge: GoogleFonts.lexend(fontSize: 16, color: textPrimaryColor),
        bodyMedium: GoogleFonts.lexend(fontSize: 14, color: textSecondaryColor),
        bodySmall: GoogleFonts.lexend(fontSize: 12, color: textSecondaryColor),
      ),
    );
  }

  static ThemeData get lightBoyTheme {
    final baseTextTheme = GoogleFonts.lexendTextTheme();

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: boyPrimaryColor,
        secondary: boySecondaryColor,
        surface: boyBackgroundColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: boyBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: boySurfaceColor,
        foregroundColor: textPrimaryColor,
        iconTheme: const IconThemeData(color: textPrimaryColor),
        titleTextStyle: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: boySurfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.lexend(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: boySurfaceColor,
        hintStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textHintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textHintColor.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: boyPrimaryColor, width: 2),
        ),
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.lexend(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
        displayMedium: GoogleFonts.lexend(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
        displaySmall: GoogleFonts.lexend(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
        headlineMedium: GoogleFonts.lexend(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryColor,
        ),
        titleLarge: GoogleFonts.lexend(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textPrimaryColor,
        ),
        bodyLarge: GoogleFonts.lexend(fontSize: 16, color: textPrimaryColor),
        bodyMedium: GoogleFonts.lexend(fontSize: 14, color: textSecondaryColor),
        bodySmall: GoogleFonts.lexend(fontSize: 12, color: textSecondaryColor),
      ),
    );
  }

  static ThemeData get darkTheme {
    // Future dark theme support
    return lightNeutralTheme;
  }

  static Color? getSurfaceColor(ThemeVariant variant) {
    switch (variant) {
      case ThemeVariant.neutral:
        return neutralSurfaceColor;
      case ThemeVariant.girl:
        return girlSurfaceColor;
      case ThemeVariant.boy:
        return boySurfaceColor;
    }
  }
}
