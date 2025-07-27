import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/data/models/todo_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_todo_form_controller.g.dart';

@riverpod
class EditTodoFormController extends _$EditTodoFormController {
  @override
  TodoFormState build(Todo? initialTodo) {
    if (initialTodo != null) {
      return TodoFormState.fromTodo(initialTodo);
    }

    return const TodoFormState();
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDate(DateTime? date) {
    state = state.copyWith(selectedDate: date);
  }

  void updateTime(TimeOfDay? time) {
    state = state.copyWith(selectedTime: time);
  }

  void updateNotes(String description) {
    state = state.copyWith(description: description);
  }
}
