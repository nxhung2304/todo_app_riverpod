import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/features/todo/strings/home_strings.dart';
import 'package:learn_riverpod/features/todo/strings/settings_strings.dart';
import 'package:learn_riverpod/features/todo/strings/todo_strings.dart';
import 'package:learn_riverpod/shared/enums/navigation_item.dart';
import 'package:learn_riverpod/shared/models/navigation_destination_model.dart';

class SharedBottomNav extends StatelessWidget {
  final String currentRoute;

  const SharedBottomNav({super.key, required this.currentRoute});

  List<NavigationDestinationModel> get _destinations => [
    NavigationDestinationModel(
      icon: Icons.home,
      label: HomeStrings.title,
      route: AppRoutes.home,
    ),
    NavigationDestinationModel(
      icon: Icons.task,
      label: TodoStrings.title,
      route: AppRoutes.todo,
    ),
    NavigationDestinationModel(
      icon: Icons.category,
      label: CategoryStrings.title,
      route: AppRoutes.category,
    ),
    NavigationDestinationModel(
      icon: Icons.settings,
      label: SettingsStrings.title,
      route: AppRoutes.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _getCurrentIndex(),
      onDestinationSelected: (index) => _navigateToTab(context, index),
      destinations:
          _destinations
              .map(
                (dest) => NavigationDestination(
                  icon: Icon(dest.icon),
                  label: dest.label,
                ),
              )
              .toList(),
    );
  }

  int _getCurrentIndex() {
    return NavigationItem.fromRoute(currentRoute).index;
  }

  void _navigateToTab(BuildContext context, int index) {
    final destination = _destinations[index];
    context.go(destination.route);
  }
}
