// shared/widgets/auth/protected_route.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/models/auth_status.dart';
import 'package:learn_riverpod/features/auth/presentation/pages/login_page.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/shared/widgets/layout/error_page.dart';
import 'package:learn_riverpod/shared/widgets/layout/loading_page.dart';

class ProtectedRoute extends ConsumerWidget {
  final Widget child;
  final String? redirectPath; // Optional redirect after login

  const ProtectedRoute({
    super.key, 
    required this.child,
    this.redirectPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      data: (status) => status.when(
        initialize: () => const LoadingPage(),
        loading: () => const LoadingPage(),
        authenticated: (user) => child,
        unauthenticated: () => LoginPage(redirectPath: redirectPath),
        error: (message) => ErrorPage(
          message: message,
        ),
      ),
      loading: () => const LoadingPage(),
      error: (error, stackTrace) => ErrorPage(
        message: 'Authentication error: $error',
      ),
    );
  }
}
