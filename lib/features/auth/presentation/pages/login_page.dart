import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: AuthStrings.login,
      currentRoute: AppRoutes.login,
      showAppBar: true,
      showBottomNav: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputFormField(
              hintText: AuthStrings.email,
              prefixIcon: Icons.email_outlined,
              onChanged: (newEmail) {
                print(newEmail);
              },
            ),
            SizedBox(height: 12),
            InputFormField(
              hintText: AuthStrings.password,
              prefixIcon: Icons.password_outlined,
              isPassword: true,
              onChanged: (newEmail) {
                print(newEmail);
              },
            ),
            SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
              onPressed: () {
                print("Login");
              },
              child: Text(AuthStrings.login),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AuthStrings.dontHaveAnAccount),
                SizedBox(width: 8),
                Text(AuthStrings.signUp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
