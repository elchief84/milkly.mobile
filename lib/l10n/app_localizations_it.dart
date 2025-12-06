// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Milkly';

  @override
  String get appTagline => 'Tracciamento dell\'allattamento semplificato';

  @override
  String get home => 'Home';

  @override
  String get plan => 'Piano';

  @override
  String get growth => 'Crescita';

  @override
  String get settings => 'Impostazioni';

  @override
  String get welcomeToMilkly => 'Benvenuto in Milkly';

  @override
  String get onboardingSubtitle =>
      'Configuriamo insieme il tuo piano di allattamento';

  @override
  String get getStarted => 'Inizia';

  @override
  String get dashboardTimerPlaceholder =>
      'Dashboard e timer di allattamento andranno qui';

  @override
  String get planSchedulePlaceholder =>
      'Piano e programmazione allattamento andranno qui';

  @override
  String get growthTrackingPlaceholder =>
      'Tracciamento crescita del bambino andrà qui';

  @override
  String get settingsPreferencesPlaceholder =>
      'Impostazioni e preferenze dell\'app andranno qui';

  @override
  String get chatbotPlaceholder => '(Il flusso guidato del chatbot andrà qui)';
}
