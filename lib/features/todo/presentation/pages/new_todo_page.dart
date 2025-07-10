import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/app/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_list.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_text_field.dart';

class NewTodoPage extends HookConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTitleController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add New Todo", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          _buildTodoTitle(todoTitleController),
          _buildSubmitTodo(context, todoTitleController, ref),
        ],
      ),
    );
  }

  Widget _buildTodoTitle(TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Todo title"),
        BaseTextField(textFieldController: controller),
      ],
    );
  }

  Widget _buildSubmitTodo(
    BuildContext context,
    TextEditingController todoTitleController,
    WidgetRef ref,
  ) {
    return ElevatedButton(
      onPressed: () {
        final todoTitle = todoTitleController.text.trim();
        if (todoTitle.isEmpty) {
          print("Title is empty");
          return;
        }

        ref.read(todoListProvider.notifier).addTodo(title: todoTitle);
        print("Added new todo");
        context.go(AppRoutes.root);
      },
      child: Text("Add todo"),
    );
  }
}
