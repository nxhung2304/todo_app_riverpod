import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/app/presentation/providers/app_bar_controller_provider.dart';

class AdaptiveAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AdaptiveAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarState = ref.watch(appBarControllerProvider);

    Widget? buildLeading() {
      return appBarState.showBackButton
          ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:
                appBarState.onBackPressed ?? () => Navigator.of(context).pop(),
          )
          : null;
    }

    return AppBar(
      title: Text(appBarState.title),
      backgroundColor: appBarState.backgroundColor,
      foregroundColor: appBarState.foregroundColor,
      centerTitle: appBarState.centerTitle,
      elevation: appBarState.elevation,
      leading: buildLeading(),
      actions: appBarState.actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
