import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/states/auth_state.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_app_bar.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_bottom_nav.dart';

class SharedScaffold extends ConsumerWidget {
  final String title;
  final Widget body;
  final String currentRoute;
  final List<Widget>? appBarActions;
  final FloatingActionButton? floatingActionButton;
  final bool showBottomNav;
  final bool showAppBar;
  final bool centerTitle;
  final Color? appBarBackgroundColor;

  const SharedScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentRoute,
    this.appBarActions,
    this.floatingActionButton,
    this.showBottomNav = true,
    this.showAppBar = true,
    this.centerTitle = true,
    this.appBarBackgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar:
          showAppBar
              ? SharedAppBar(
                title: title,
                actions: [
                  ...?appBarActions,
                  authState.maybeWhen(
                    authenticated:
                        (_) => IconButton(
                          onPressed: () {
                            ref.read(authNotifierProvider.notifier).logout();
                          },
                          icon: const Icon(Icons.logout),
                        ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
                centerTitle: centerTitle,
                backgroundColor: appBarBackgroundColor,
              )
              : null,
      bottomNavigationBar:
          showBottomNav ? SharedBottomNav(currentRoute: currentRoute) : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
