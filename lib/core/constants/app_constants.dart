/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Milkly';
  static const String appVersion = '0.1.0';

  // Database
  static const String databaseName = 'milkly.db';
  
  // SharedPreferences Keys
  static const String keyOnboardingCompleted = 'onboarding_completed';
  static const String keyThemeMode = 'theme_mode';
  
  // Default Values
  static const int defaultFeedingDurationMinutes = 15;
  static const int maxFeedingDurationMinutes = 120;
}

