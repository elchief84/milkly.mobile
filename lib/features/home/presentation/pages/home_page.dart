import 'package:flutter/material.dart';
import 'package:smart_breastfeeding/core/constants/app_constants.dart';

/// Home page - main dashboard
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          ],
        ),
      ),
    );
  }
}
