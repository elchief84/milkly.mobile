import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';

/// Home page - main dashboard
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _resetOnboarding(BuildContext context) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool(AppConstants.keyOnboardingCompleted, false);

    if (context.mounted) {
      context.go(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.child_care,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text('Home', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 12),
            Text(
              'Dashboard & feeding timer will go here',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => _resetOnboarding(context),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Riavvia Onboarding'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
