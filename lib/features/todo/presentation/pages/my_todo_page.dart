import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';

class MyTodoPage extends HookConsumerWidget {
  const MyTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextButton(
          child: Text("Add new 1"),
          onPressed: () {
            context.go(AppRoutes.newTodo);
          },
        ),
      ],
    );
  }
}
