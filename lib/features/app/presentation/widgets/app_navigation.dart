// app_navigation.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/adaptive_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/adaptive_bottom_app_bar.dart';

class AppNavigation extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AdaptiveAppBar(),
      body: navigationShell,
      bottomNavigationBar: AdaptiveBottomAppBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
