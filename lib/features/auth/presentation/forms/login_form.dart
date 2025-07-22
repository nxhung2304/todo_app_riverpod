import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/core/models/auth_status.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/form_fields.dart';

class LoginForm extends HookConsumerWidget {
  final bool isLoading;

  const LoginForm({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController(text: 'user@example.com');
    final passwordController = useTextEditingController(text: '123456');

    final authState = ref.watch(authNotifierProvider);

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          ..._buildLoginForm(
            context,
            ref,
            loginFormKey,
            emailController,
            passwordController,
            authState,
          ),
          ..._buildSocialLogin(),
        ],
      ),
    );
  }

  List<Widget> _buildLoginForm(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> loginFormKey,
    TextEditingController emailController,
    TextEditingController passwordController,
    AsyncValue<AuthStatus> authState,
  ) {
    final isLoading = authState.when(
      data:
          (status) => status.when(
            loading: () => true,
            initialize: () => false,
            authenticated: (_) => false,
            unauthenticated: () => false,
            error: (_) => false,
          ),
      loading: () => true,
      error: (_, __) => false,
    );

    return [
      FormFields.email(
        controller: emailController, // Pass controller directly if supported
        // onChanged: (newEmail) {
        //   emailController.text = newEmail;
        // },
      ),
      const SizedBox(height: 12),
      FormFields.password(
        controller: passwordController,
        // onChanged: (newPassword) {
        //   passwordController.text = newPassword;
        // },
      ),
      const SizedBox(height: 12),

      authState.when(
        data:
            (status) => status.when(
              error:
                  (message) => Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 12),
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
              initialize: () => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              authenticated: (_) => const SizedBox.shrink(),
              unauthenticated: () => const SizedBox.shrink(),
            ),
        loading: () => const SizedBox.shrink(),
        error:
            (error, _) => Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Error: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
      ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
        onPressed:
            isLoading
                ? null
                : () async {
                  if (loginFormKey.currentState!.validate()) {
                    print("Submit Login ===");
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");

                    await ref
                        .read(authNotifierProvider.notifier)
                        .login(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        );
                  }
                },
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                : Text(
                  AuthStrings.login,
                  style: const TextStyle(color: Colors.black),
                ),
      ),
      const SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AuthStrings.dontHaveAnAccount),
          const SizedBox(width: 8),
          TextButton(
            onPressed:
                isLoading
                    ? null
                    : () {
                      context.push(AppRoutes.signup);
                    },
            child: Text(
              AuthStrings.signup,
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildSocialLogin() {
    return [
      const SizedBox(height: 12),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
        onTap: () {
          print("Sign in with Google tapped");
          // Implement Google Sign-In logic here
        },
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/icons/google_logo.png',
              width: 24,
              height: 24,
            ),
          ),
          title: const Text(
            "Sign in with Google",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ];
  }
}
