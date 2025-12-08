import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';
import 'package:smart_breastfeeding/core/theme/app_theme.dart';
import 'package:smart_breastfeeding/core/theme/theme_cubit.dart';
import 'package:smart_breastfeeding/l10n/app_localizations.dart';

/// Main application widget
class MilklyApp extends StatelessWidget {
  const MilklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(getIt<SharedPreferences>()),
      child: const _MilklyAppContent(),
    );
  }
}

/// App content with theme management and routing
class _MilklyAppContent extends StatefulWidget {
  const _MilklyAppContent();

  @override
  State<_MilklyAppContent> createState() => _MilklyAppContentState();
}

class _MilklyAppContentState extends State<_MilklyAppContent> {
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

    // Show onboarding only if not completed
    final showOnboarding = !hasCompletedOnboarding;

    return createAppRouter(showOnboarding: showOnboarding);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeVariant>(
      builder: (context, themeVariant) {
        return MaterialApp.router(
          title: AppConstants.appName,
          theme: AppTheme.getThemeForVariant(themeVariant),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('it')],
        );
      },
    );
  }
}
