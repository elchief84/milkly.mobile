import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_breastfeeding/core/navigation/scaffold_with_bottom_nav.dart';
import 'package:smart_breastfeeding/features/growth/presentation/pages/growth_page.dart';
import 'package:smart_breastfeeding/features/home/presentation/pages/home_page.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:smart_breastfeeding/features/onboarding/presentation/pages/onboarding_review_page.dart';
import 'package:smart_breastfeeding/features/plan/presentation/pages/plan_page.dart';
import 'package:smart_breastfeeding/features/settings/presentation/pages/settings_page.dart';

/// App routes
class AppRoutes {
  AppRoutes._();

  // Main routes
  static const String home = '/';
  static const String plan = '/plan';
  static const String growth = '/growth';
  static const String settings = '/settings';

  // Onboarding
  static const String onboarding = '/onboarding';
  static const String onboardingReview = '/onboarding/review';
}

/// Create app router instance
GoRouter createAppRouter({required bool showOnboarding}) {
  return GoRouter(
    initialLocation: showOnboarding ? AppRoutes.onboarding : AppRoutes.home,
    routes: [
      // Onboarding flow (fullscreen, modal)
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          fullscreenDialog: true,
          child: const OnboardingPage(),
        ),
      ),

      // Onboarding review (fullscreen, no back)
      GoRoute(
        path: AppRoutes.onboardingReview,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: OnboardingReviewPage(
              answers: extra?['answers'] as Map<String, dynamic>? ?? {},
              questionnaire: extra?['questionnaire'],
            ),
          );
        },
      ),

      // Main app with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNav(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const HomePage()),
          ),
          GoRoute(
            path: AppRoutes.plan,
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const PlanPage()),
          ),
          GoRoute(
            path: AppRoutes.growth,
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const GrowthPage()),
          ),
          GoRoute(
            path: AppRoutes.settings,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SettingsPage(),
            ),
          ),
        ],
      ),
    ],
  );
}
