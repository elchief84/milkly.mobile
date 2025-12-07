import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/l10n/app_localizations.dart';

/// Main application widget
class MilklyApp extends StatefulWidget {
  const MilklyApp({super.key});

  @override
  State<MilklyApp> createState() => _MilklyAppState();
}

class _MilklyAppState extends State<MilklyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = _createRouter();
  }

  GoRouter _createRouter() {
    final prefs = getIt<SharedPreferences>();
    final hasCompletedOnboarding =
        prefs.getBool(AppConstants.keyOnboardingCompleted) ?? false;

    // In debug mode, always show onboarding
    final showOnboarding = kDebugMode || !hasCompletedOnboarding;

    return createAppRouter(showOnboarding: showOnboarding);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('it'),
      ],
    );
  }
}

