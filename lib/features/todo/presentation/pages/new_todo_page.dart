import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/todo_form.dart';
import 'package:learn_riverpod/features/todo/strings/new_todo_strings.dart';
import 'package:learn_riverpod/features/todo/strings/todo_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class NewTodoPage extends LocalizedConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    Future<void> _onSubmit(
      BuildContext context,
      WidgetRef ref,
      TodoParams todoParams,
    ) async {
      final result = await ref
          .read(todoControllerProvider.notifier)
          .createTodo(todoParams);

      if (!context.mounted) return;

      if (result.isSuccess) {
        AppSnackBar.showSuccess(context, TodoStrings.createSuccess);
        context.pop();
      } else {
        AppSnackBar.showError(context, result.error.toString());
      }
    }

    return WillPopScope(
      child: SharedScaffold(
        title: NewTodoStrings.title,
        currentRoute: AppRoutes.todo,
        body: TodoForm.create(
          onSubmit:
              (TodoParams todoParams) => _onSubmit(context, ref, todoParams),
        ),
      ),
      onWillPop: () async {
        // final hasChanges =
        //     ref.read(todoFormControllerProvider.notifier).hasChanges();
        // if (!hasChanges) {
        //   return true;
        // }

        final willPop = await _showExitDialog(context);
        return willPop ?? false;
      },
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text('Confirm exit'),
            content: Text('Are you want to exit? Data unsave will be lost.'),
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
