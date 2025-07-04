import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app_riverpod/features/counter/presentation/pages/counter_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});
@override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: CounterPage(),
      ),
    );
  }
}
