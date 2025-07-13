import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/todo_form_state.dart';
import 'package:learn_riverpod/shared/hooks/use_debounce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';

part 'todo_form_provider.g.dart';

@riverpod
class TodoForm extends _$TodoForm {
  @override
  TodoFormState build() {
    return TodoFormState();
  }

  bool isUnsaved() {
    if (state.title.isNotEmpty) return true;
    if (state.notes.isNotEmpty) return true;
    if (state.selectedDate != null) return true;
    if (state.selectedTime != null) return true;

    return false;
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

  void updateNotes(String notes) {
    state = state.copyWith(notes: notes);
  }

  void reset() {
    state = TodoFormState();
  }
}
