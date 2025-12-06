import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';
import 'package:smart_breastfeeding/core/di/injection.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';

/// Onboarding page - guided chatbot flow for initial setup
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.waving_hand,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Welcome to ${AppConstants.appName}',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Let\'s set up your breastfeeding plan together',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Text(
                '(Guided chatbot flow will go here)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => _completeOnboarding(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setBool(AppConstants.keyOnboardingCompleted, true);

    if (context.mounted) {
      context.go(AppRoutes.home);
    }
  }
}

