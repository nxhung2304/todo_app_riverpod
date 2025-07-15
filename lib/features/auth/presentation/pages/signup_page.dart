import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/presentation/validators/auth_validators.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/strings/shared_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupFormKey = useMemoized(() => GlobalKey<FormState>());

    final fullNameController = useTextEditingController(text: '');
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final confirmPasswordController = useTextEditingController(text: '');

    return WillPopScope(
      onWillPop: () async {
        var isUnsaved = false;
        if (fullNameController.text.isNotEmpty) {
          isUnsaved = true;
        }

        if (emailController.text.isNotEmpty) {
          isUnsaved = true;
        }

        if (passwordController.text.isNotEmpty) {
          isUnsaved = true;
        }

        if (confirmPasswordController.text.isNotEmpty) {
          isUnsaved = true;
        }

        if (!isUnsaved) return true;

        final willPop = await _showExitDialog(context);

        return willPop ?? true;
      },
      child: SharedScaffold(
        title: AuthStrings.signUp,
        currentRoute: AppRoutes.signup,
        showAppBar: true,
        showBottomNav: false,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: signupFormKey,
            child: Column(
              children: [
                InputFormField(
                  hintText: SharedStrings.fullName,
                  prefixIcon: Icons.person,
                  onChanged: (newFullName) {
                    fullNameController.text = newFullName;
                  },
                  validator: AuthValidators.validateFullName,
                ),
                SizedBox(height: 12),
                InputFormField(
                  hintText: AuthStrings.email,
                  prefixIcon: Icons.email_outlined,
                  onChanged: (newEmail) {
                    emailController.text = newEmail;
                  },
                  validator: AuthValidators.validateEmail,
                ),
                SizedBox(height: 12),
                InputFormField(
                  hintText: AuthStrings.password,
                  prefixIcon: Icons.password_outlined,
                  isPassword: true,
                  onChanged: (newPassword) {
                    passwordController.text = newPassword;
                  },
                  validator: AuthValidators.validatePassword,
                ),
                SizedBox(height: 12),
                InputFormField(
                  hintText: AuthStrings.confirmPassword,
                  prefixIcon: Icons.password_outlined,
                  isPassword: true,
                  onChanged: (newConfirmPassword) {
                    confirmPasswordController.text = newConfirmPassword;
                  },
                  validator: AuthValidators.validatePassword,
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                  ),
                  onPressed: () {
                    if (!signupFormKey.currentState!.validate()) {
                      print("User signup invalid");
                      return;
                    }

                    print("Signup ===");
                    print("Fullname: ${fullNameController.text}");
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");
                    print(
                      "Confirm Password: ${confirmPasswordController.text}",
                    );
                  },
                  child: Text(
                    AuthStrings.login,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text('Confirm exit'),
            content: Text('Are you want to exit? Form unsave will be lost.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }
}
