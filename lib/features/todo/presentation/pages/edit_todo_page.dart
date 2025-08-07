import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/edit_todo_form.dart';
import 'package:learn_riverpod/features/todo/strings/edit_todo_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_app_bar.dart';

class EditTodoPage extends LocalizedConsumerWidget {
  final int todoId;

  const EditTodoPage({super.key, required this.todoId});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todoControllerProvider);

    return todosAsync.when(
      loading: () {
        final todos = todosAsync.valueOrNull;
        if (todos != null) {
          final foundTodo = todos.cast<Todo?>().firstWhere(
            (todo) => todo?.id == todoId,
            orElse: () => null,
          );

          if (foundTodo != null) {
            return EditTodoForm(todo: foundTodo);
          }
        }

        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
      error: (error, stackTrace) => Scaffold(
        appBar: const SharedAppBar(title: 'Error'),
        body: Center(child: Text('Error: $error')),
      ),
      data: (todos) {
        final foundTodo = todos.cast<Todo?>().firstWhere(
          (todo) => todo?.id == todoId,
          orElse: () => null,
        );

        if (foundTodo == null) {
          return Scaffold(
            appBar: const SharedAppBar(title: 'Error'),
            body: Center(child: Text(EditTodoStrings.todoNotFound)),
          );
        }

        return EditTodoForm(todo: foundTodo);
      },
    );
  }
}
