import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final WidgetRef ref;

  const TodoItemWidget({super.key, required this.todo, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Checkbox(
          value: todo.done,
          onChanged: (value) {
            ref.read(todoControllerProvider.notifier).toggleTodo(todo.id);
          },
        ),
        title: TextButton(
          onPressed: () {
            context.push(AppRoutes.editTodoPath(todo.id));
          },
          child: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.done ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            ref.read(todoControllerProvider.notifier).deleteTodo(todo.id);
          },
        ),
      ),
    );
  }
}
