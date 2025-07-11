import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/app/presentation/providers/app_bar_config_provider.dart';
import 'package:learn_riverpod/features/app/presentation/providers/app_bar_controller_provider.dart';

class AdaptiveBottomAppBar extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AdaptiveBottomAppBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarState = ref.watch(appBarControllerProvider);

    if (!appBarState.showBottomNav) {
      return const SizedBox.shrink();
    }

    return NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        final isOtherTab = index != navigationShell.currentIndex;
        if (isOtherTab) {
          _updateAppBarForTab(ref, index);
        }

        navigationShell.goBranch(index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.task_alt_outlined),
          selectedIcon: Icon(Icons.task_alt),
          label: 'Todo',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  void _updateAppBarForTab(WidgetRef ref, int tabIndex) {
    final appBarDefaultConfig = ref.read(appBarConfigProvider.notifier);

    switch (tabIndex) {
      case 0:
        appBarDefaultConfig.setHomeConfig();
        break;
      case 1:
        appBarDefaultConfig.setTodoListConfig();
        break;
      case 2:
        appBarDefaultConfig.setSearchConfig();
        break;
      case 3:
        appBarDefaultConfig.setSettingsConfig();
        break;
    }
  }
}
