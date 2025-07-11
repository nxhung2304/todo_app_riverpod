import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';

class SharedBottomNav extends StatelessWidget {
  final String currentRoute;

  const SharedBottomNav({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _getCurrentIndex(),
      onDestinationSelected: (index) => _navigateToTab(context, index),
      destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.task), label: 'Todo'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  int _getCurrentIndex() {
    switch (currentRoute) {
      case '/home':
        return 0;
      case '/todo':
        return 1;
      case '/search':
        return 2;
      case '/settings':
        return 3;
      default:
        if (currentRoute.startsWith('/todo')) return 1;
        return 0;
    }
  }

  void _navigateToTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.todo);
        break;
      case 2:
        context.go(AppRoutes.search);
        break;
      case 3:
        context.go(AppRoutes.settings);
        break;
    }
  }
}
