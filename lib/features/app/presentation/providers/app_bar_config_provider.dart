import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/app/presentation/models/app_bar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_bar_config_provider.g.dart';

@riverpod
class AppBarConfig extends _$AppBarConfig {
  @override
  AppBarState build() {
    return AppBarState(title: 'Todo');
  }

  void setHomeConfig() {
    state = const AppBarState(
      title: 'Home',
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      showBackButton: false,
      showBottomNav: true,
    );
  }

  void setTodoListConfig() {
    state = AppBarState(
      title: 'My Todo List',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      showBackButton: false,
      showBottomNav: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // Will be handled in the UI layer
          },
        ),
      ],
    );
  }

  void setNewTodoConfig({VoidCallback? onBackPressed}) {
    state = AppBarState(
      title: 'Add New Todo',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      showBackButton: true,
      onBackPressed: onBackPressed,
      showBottomNav: false,
      centerTitle: true,
    );
  }

  void setEditTodoConfig({
    VoidCallback? onBackPressed,
    VoidCallback? onDelete,
  }) {
    state = AppBarState(
      title: 'Edit Todo',
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      showBackButton: true,
      onBackPressed: onBackPressed,
      showBottomNav: false,
      actions:
          onDelete != null
              ? [
                IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
              ]
              : null,
    );
  }

  void setSearchConfig() {
    state = const AppBarState(
      title: 'Search',
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      showBackButton: false,
      showBottomNav: true,
    );
  }

  void setSettingsConfig() {
    state = const AppBarState(
      title: 'Settings',
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      showBackButton: false,
      showBottomNav: true,
    );
  }
}
