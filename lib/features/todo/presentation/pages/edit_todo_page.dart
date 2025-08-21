import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/todo_form.dart';
import 'package:learn_riverpod/features/todo/strings/todo_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class EditTodoPage extends LocalizedConsumerWidget {
  final int todoId;

  const EditTodoPage({super.key, required this.todoId});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit(
      BuildContext context,
      WidgetRef ref,
      TodoParams params,
    ) async {
      try {
        final controller = ref.read(todoControllerProvider.notifier);

        final result = await controller.updateTodo(todoId, params);

        if (!context.mounted) return;

        if (result.isSuccess) {
          AppSnackBar.showSuccess(context, TodoStrings.updateSuccess);
          context.pop();
        } else {
          AppSnackBar.showError(context, TodoStrings.updateError);
        }
      } catch (e) {
        AppSnackBar.showError(context, e.toString());
      }
    }

    return SharedScaffold(
      title: TodoStrings.title,
      currentRoute: AppRoutes.category,
      body: TodoForm.edit(
        todoId: todoId,
        onSubmit: (params) => onSubmit(context, ref, params),
      ),
    );
  }
}
