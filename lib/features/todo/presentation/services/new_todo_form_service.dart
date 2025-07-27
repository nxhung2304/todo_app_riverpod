import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_form_controller.dart';

class TodoFormService {
  final WidgetRef ref;
  final GlobalKey<FormState> formKey;

  TodoFormService(this.ref, this.formKey);

  Future<bool> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    final formState = ref.read(todoFormControllerProvider);

    await ref
        .read(todoControllerProvider
        .notifier)
        .addTodo(
          title: formState.title,
          date: formState.selectedDate,
          time: formState.selectedTime,
          description: formState.description,
        );

    final submitState = ref.read(todoControllerProvider);

    return !submitState.hasError;
  }
}
