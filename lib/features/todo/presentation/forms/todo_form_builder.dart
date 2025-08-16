import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/category/presentation/controllers/category_controller.dart';
import 'package:learn_riverpod/features/todo/data/providers/todo_providers.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/todo_form_data.dart';

class TodoFormBuilder extends HookConsumerWidget {
  final bool isEdit;
  final int? todoId;
  final Widget Function(
    BuildContext context,
    TodoFormData formState,
    bool isLoading,
    String? error,
  )
  builder;

  const TodoFormBuilder({
    super.key,
    required this.isEdit,
    this.todoId,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryControllerProvider);

    final todoAsync =
        isEdit && todoId != null ? ref.watch(todoByIdProvider(todoId!)) : null;

    final isLoading =
        categoriesAsync.isLoading || (todoAsync?.isLoading ?? false);

    String? error;
    if (categoriesAsync.hasError) {
      error = 'Categories: ${categoriesAsync.error}';
    } else if (todoAsync?.hasError == true) {
      error = 'Todo: ${todoAsync!.error}';
    }

    if (isLoading || error != null) {
      return builder(context, TodoFormData.empty(), isLoading, error);
    }

    final formData = TodoFormData(
      categories: categoriesAsync.value ?? [],
      todo: todoAsync?.value?.data,
    );

    return builder(context, formData, false, null);
  }
}
