import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_breastfeeding/core/navigation/app_router.dart';

/// Scaffold with bottom navigation bar
class ScaffoldWithBottomNav extends StatelessWidget {
  final Widget child;

  const ScaffoldWithBottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: child, bottomNavigationBar: _BottomNavBar());
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    int currentIndex = _getIndexFromLocation(currentLocation);

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) => _onItemTapped(context, index),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.event_note_outlined),
          selectedIcon: Icon(Icons.event_note),
          label: 'Plan',
        ),
        NavigationDestination(
          icon: Icon(Icons.trending_up_outlined),
          selectedIcon: Icon(Icons.trending_up),
          label: 'Growth',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  int _getIndexFromLocation(String location) {
    if (location.startsWith(AppRoutes.plan)) return 1;
    if (location.startsWith(AppRoutes.growth)) return 2;
    if (location.startsWith(AppRoutes.settings)) return 3;
    return 0; // home
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
      case 1:
        context.go(AppRoutes.plan);
      case 2:
        context.go(AppRoutes.growth);
      case 3:
        context.go(AppRoutes.settings);
    }
  }
}
