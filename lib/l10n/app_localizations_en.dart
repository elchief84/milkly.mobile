// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Milkly';

  @override
  String get appTagline => 'Breastfeeding tracking made simple';

  @override
  String get home => 'Home';

  @override
  String get plan => 'Plan';

  @override
  String get growth => 'Growth';

  @override
  String get settings => 'Settings';

  @override
  String get welcomeToMilkly => 'Welcome to Milkly';

  @override
  String get onboardingSubtitle =>
      'Let\'s set up your breastfeeding plan together';

  @override
  String get getStarted => 'Get Started';

  @override
  String get dashboardTimerPlaceholder =>
      'Dashboard & feeding timer will go here';

  @override
  String get planSchedulePlaceholder => 'Feeding plan & schedule will go here';

  @override
  String get growthTrackingPlaceholder => 'Baby growth tracking will go here';

  @override
  String get settingsPreferencesPlaceholder =>
      'App settings & preferences will go here';

  @override
  String get chatbotPlaceholder => '(Guided chatbot flow will go here)';
}
