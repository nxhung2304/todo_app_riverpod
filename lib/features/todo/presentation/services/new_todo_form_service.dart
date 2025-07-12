import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_form_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/submit_todo_provider.dart';

class TodoFormService {
  final WidgetRef ref;
  final GlobalKey<FormState> formKey;

  TodoFormService(this.ref, this.formKey);

  Future<bool> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    final formState = ref.read(todoFormProvider);

    await ref
        .read(submitTodoProvider.notifier)
        .submit(
          title: formState.title,
          date: formState.selectedDate,
          time: formState.selectedTime,
          notes: formState.notes,
        );

    final submitState = ref.read(submitTodoProvider);

    return !submitState.hasError;
  }
}
