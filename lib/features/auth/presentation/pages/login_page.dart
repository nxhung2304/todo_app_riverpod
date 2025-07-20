import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/core/models/auth_status.dart';
import 'package:learn_riverpod/features/auth/presentation/forms/login_form.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class LoginPage extends HookConsumerWidget {
  final String? redirectPath;

  const LoginPage({super.key, this.redirectPath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider, (previous, next) {
      next.whenData((status) {
        status.whenOrNull(
          authenticated: (user) {
            final destination = redirectPath ?? AppRoutes.home;
            context.go(destination);
          },
        );
      });
    });

    return authState.when(
      data:
          (status) => status.when(
            initialize: () => _buildLoginUI(context, ref, false),
            loading: () => _buildLoginUI(context, ref, true),
            unauthenticated: () => _buildLoginUI(context, ref, false),
            authenticated: (user) {
              return const SizedBox.shrink();
            },
            error: (message) => _buildErrorUI(context, ref, message),
          ),
      loading: () => _buildLoginUI(context, ref, true),
      error: (error, _) => _buildErrorUI(context, ref, error.toString()),
    );
  }

  Widget _buildLoginUI(BuildContext context, WidgetRef ref, bool isLoading) {
    return SharedScaffold(
      title: AuthStrings.login,
      currentRoute: AppRoutes.login,
      showAppBar: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            LoginForm(isLoading: isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorUI(BuildContext context, WidgetRef ref, String message) {
    return SharedScaffold(
      title: AuthStrings.login,
      currentRoute: AppRoutes.login,
      showAppBar: true,
      showBottomNav: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(color: Colors.red.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red.shade600),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.red.shade600),
                    ),
                  ),
                ],
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
