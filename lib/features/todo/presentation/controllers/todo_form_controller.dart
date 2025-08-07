import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/todo_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';

part 'todo_form_controller.g.dart';

@riverpod
class TodoFormController extends _$TodoFormController {
  @override
  TodoFormState build() {
    return TodoFormState();
  }

  void loadTodo(Todo todo) {
    state = TodoFormState.fromTodo(todo);
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

  void reset() {
    state = TodoFormState();
  }

  bool hasChanges() {
    if (state.title.isNotEmpty) return true;
    if (state.description.isNotEmpty) return true;
    if (state.selectedDate != null) return true;
    if (state.selectedTime != null) return true;

    return false;
  }
}
