import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/presentation/pages/login_page.dart';
import 'package:learn_riverpod/shared/providers/auth_state_provider.dart';

class ProtectedRoute extends ConsumerWidget {
  final Widget child;

  const ProtectedRoute({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return child;
        } else {
          return LoginPage();
        }
      },
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => LoginPage(),
    );
  }
}
