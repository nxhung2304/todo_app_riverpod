import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/app/presentation/models/app_bar_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_bar_controller_provider.g.dart';

@riverpod
class AppBarController extends _$AppBarController {
  @override
  AppBarState build() {
    return AppBarState(title: 'Todo');
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateBackground(Color background) {
    state = state.copyWith(backgroundColor: background);
  }

  void updateForeground(Color foreground) {
    state = state.copyWith(foregroundColor: foreground);
  }

  void updateBackgroundButton({required bool show, VoidCallback? onPress}) {
    state = state.copyWith(showBackButton: show, onBackPressed: onPress);
  }

  void updateActions(List<Widget>? actions) {
    state = state.copyWith(actions: actions);
  }

  void updateBottomNavVisibility(bool show) {
    state = state.copyWith(showBottomNav: show);
  }

  void updateAppBar({
    String? title,
    Color? backgroundColor,
    Color? foregroundColor,
    bool? showBackButton,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
    bool? showBottomNav,
    bool? centerTitle,
    double? elevation,
  }) {
    state = state.copyWith(
      title: title ?? state.title,
      backgroundColor: backgroundColor ?? state.backgroundColor,
      foregroundColor: foregroundColor ?? state.foregroundColor,
      showBackButton: showBackButton ?? state.showBackButton,
      onBackPressed: onBackPressed,
      actions: actions,
      showBottomNav: showBottomNav ?? state.showBottomNav,
      centerTitle: centerTitle ?? state.centerTitle,
      elevation: elevation ?? state.elevation,
    );
  }

  void reset() {
    state = const AppBarState(title: 'App');
  }

  // void setHomeConfig() {
  //   state = const AppBarState(
  //     title: 'Home',
  //     backgroundColor: Colors.blue,
  //     foregroundColor: Colors.white,
  //     showBackButton: false,
  //     showBottomNav: true,
  //   );
  // }
  //
  // void setTodoListConfig() {
  //   state = AppBarState(
  //     title: 'My Todo List',
  //     backgroundColor: Colors.purple,
  //     foregroundColor: Colors.white,
  //     showBackButton: false,
  //     showBottomNav: true,
  //     actions: [
  //       IconButton(
  //         icon: const Icon(Icons.add),
  //         onPressed: () {
  //           // Will be handled in the UI layer
  //         },
  //       ),
  //     ],
  //   );
  // }
  //
  // void setNewTodoConfig({VoidCallback? onBackPressed}) {
  //   state = AppBarState(
  //     title: 'Add New Todo',
  //     backgroundColor: Colors.purple,
  //     foregroundColor: Colors.white,
  //     showBackButton: true,
  //     onBackPressed: onBackPressed,
  //     showBottomNav: false,
  //     centerTitle: true,
  //   );
  // }
  //
  // void setEditTodoConfig({
  //   VoidCallback? onBackPressed,
  //   VoidCallback? onDelete,
  // }) {
  //   state = AppBarState(
  //     title: 'Edit Todo',
  //     backgroundColor: Colors.purple,
  //     foregroundColor: Colors.white,
  //     showBackButton: true,
  //     onBackPressed: onBackPressed,
  //     showBottomNav: false,
  //     actions:
  //         onDelete != null
  //             ? [
  //               IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
  //             ]
  //             : null,
  //   );
  // }
  //
  // void setSearchConfig() {
  //   state = const AppBarState(
  //     title: 'Search',
  //     backgroundColor: Colors.green,
  //     foregroundColor: Colors.white,
  //     showBackButton: false,
  //     showBottomNav: true,
  //   );
  // }
  //
  // void setSettingsConfig() {
  //   state = const AppBarState(
  //     title: 'Settings',
  //     backgroundColor: Colors.orange,
  //     foregroundColor: Colors.white,
  //     showBackButton: false,
  //     showBottomNav: true,
  //   );
  // }
}
