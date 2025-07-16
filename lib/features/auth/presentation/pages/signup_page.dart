import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/presentation/forms/sign_up_form.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/signup_form_provider.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        final hasChanges =
            ref.read(signupFormNotifierProvider.notifier).hasChanges;
        if (hasChanges) {
          final shouldPop = await _showExitDialog(context);

          return shouldPop ?? false;
        }

        return true;
      },
      child: SharedScaffold(
        title: AuthStrings.signUp,
        currentRoute: AppRoutes.signup,
        showAppBar: true,
        showBottomNav: false,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: SignUpForm(),
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
