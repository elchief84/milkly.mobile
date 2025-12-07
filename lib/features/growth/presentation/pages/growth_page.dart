import 'package:flutter/material.dart';

/// Growth page - baby growth tracking
class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Growth')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.trending_up,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text('Growth', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 12),
            Text(
              'Baby growth tracking will go here',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
