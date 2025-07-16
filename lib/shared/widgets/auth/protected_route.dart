import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/presentation/pages/login_page.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/states/auth_state.dart';
import 'package:learn_riverpod/shared/widgets/layout/error_page.dart';
import 'package:learn_riverpod/shared/widgets/layout/loading_page.dart';

class ProtectedRoute extends ConsumerWidget {
  final Widget child;

  const ProtectedRoute({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      initial: () => const LoadingPage(),
      loading: () => const LoadingPage(),
      authenticated: (user) => child,
      unauthenticated: () => const LoginPage(),
      error: (message) => ErrorPage(message: message),
    );
  }
}

