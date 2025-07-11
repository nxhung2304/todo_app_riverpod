import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_bottom_nav.dart';

class MyTodoPage extends HookConsumerWidget with RouteAware {
  const MyTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SharedAppBar('My todo', Colors.blue, Colors.white),
      body: Column(
        children: [
          TextButton(
            child: Text("Add new 1"),
            onPressed: () {
              context.push(AppRoutes.newTodo);
            },
          ),
        ],
      ),
      bottomNavigationBar: SharedBottomNav(currentRoute: '/todo'),
    );
  }
}
