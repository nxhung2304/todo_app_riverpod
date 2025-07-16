import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/data/models/auth_state.dart';
import 'package:learn_riverpod/features/auth/presentation/forms/login_form.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return authState.when(
      initial: () => Text("Welcome"),
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      authenticated: (user) => Text("Hello ${user.email}"),
      unauthenticated:
          () => SharedScaffold(
            title: AuthStrings.login,
            currentRoute: AppRoutes.login,
            showAppBar: true,
            showBottomNav: false,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: LoginForm(),
            ),
          ),
      error: (message) => Text(message),
    );
  }
}
