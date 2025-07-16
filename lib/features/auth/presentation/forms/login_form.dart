import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/form_fields.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          ..._buildLoginForm(context, ref, emailController, passwordController),
          ..._buildSocialLogin(),
        ],
      ),
    );
  }

  List<Widget> _buildLoginForm(
    BuildContext context,
    WidgetRef ref,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return [
      FormFields.email(
        onChanged: (newEmail) {
          emailController.text = newEmail;
        },
      ),
      SizedBox(height: 12),
      FormFields.password(
        onChanged: (newPassword) {
          passwordController.text = newPassword;
        },
      ),
      SizedBox(height: 12),
      ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
        onPressed: () async {
          print("Submit Login ===");
          await ref
              .read(authNotifierProvider.notifier)
              .login(
                email: emailController.text,
                password: passwordController.text,
              );
          print("Email: ${emailController.text}");
          print("Password: ${passwordController.text}");
        },
        child: Text(AuthStrings.login, style: TextStyle(color: Colors.black)),
      ),
      SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AuthStrings.dontHaveAnAccount),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              context.push(AppRoutes.signup);
            },
            child: Text("Signup", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildSocialLogin() {
    return [
      SizedBox(height: 12),
      Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: ListTile(
          leading: Icon(Icons.facebook, color: Colors.white),
          title: Text(
            "Connect with Facebook",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      Divider(color: Colors.white),
      Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: ListTile(
          leading: Icon(Icons.facebook, color: Colors.white),
          title: Text(
            "Connect with Google",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }
}
