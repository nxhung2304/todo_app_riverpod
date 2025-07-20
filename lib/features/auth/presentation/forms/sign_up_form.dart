import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/signup_form_provider.dart';
import 'package:learn_riverpod/features/auth/presentation/validators/auth_validators.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/strings/shared_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/form_fields.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

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
            onChanged: formNotifier.updateEmail,
            validator: AuthValidators.validateEmail,
          ),
          SizedBox(height: 12),
          FormFields.password(
            onChanged: formNotifier.updatePassword,
            validator: AuthValidators.validatePassword,
          ),
          SizedBox(height: 12),
          FormFields.password(
            onChanged: formNotifier.updateConfirmPassword,
            validator: AuthValidators.validatePassword,
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

              await authNotifier.signup(
                fullName: formState.fullName,
                email: formState.email,
                password: formState.password,
              );
            },
            child: Text(
              AuthStrings.login,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
