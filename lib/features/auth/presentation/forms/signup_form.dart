import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/signup_form_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/validators/auth_validators.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/strings/shared_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/form_fields.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

class SignupForm extends HookConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupFormKey = useMemoized(() => GlobalKey<FormState>());

    final formState = ref.watch(signupFormNotifierProvider);
    final formNotifier = ref.read(signupFormNotifierProvider.notifier);

    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Form(
      key: signupFormKey,
      child: Column(
        children: [
          InputFormField(
            initialValue: formState.fullName,
            hintText: SharedStrings.fullName,
            prefixIcon: Icons.person,
            onChanged: formNotifier.updateFullName,
            validator: AuthValidators.validateFullName,
          ),
          SizedBox(height: 12),
          FormFields.email(
            initialValue: formState.email,
            onChanged: formNotifier.updateEmail,
            validator: AuthValidators.validateEmail,
          ),
          SizedBox(height: 12),
          FormFields.password(
            initialValue: formState.password,
            onChanged: formNotifier.updatePassword,
            validator: AuthValidators.validatePassword,
          ),
          SizedBox(height: 12),
          FormFields.password(
            initialValue: formState.confirmPassword,
            onChanged: formNotifier.updateConfirmPassword,
            validator: (confirmPassword) {
              return AuthValidators.validateConfirmPassword(
                formState.password,
                confirmPassword,
              );
            },
          ),
          SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
            onPressed: () async {
              print("Signup ===");

              if (!signupFormKey.currentState!.validate()) {
                print("User signup invalid");
                return;
              }

              final response = await authNotifier.signup(
                fullName: formState.fullName,
                email: formState.email,
                password: formState.password,
              );
              if (response.isSuccess) {
                if (context.mounted) {
                  context.go(AppRoutes.login);
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(child: Text(AuthStrings.signupSuccess)),
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
              } else {
                if (response.error is List<String>) {
                  final messages = response.error as List<String>;
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: Text("Đăng ký thất bại"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                messages.map((msg) => Text("• $msg")).toList(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response.error.toString()),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(
              AuthStrings.signup,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
