import 'package:flutter/material.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/core/extensions/time_extension.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_form_state.freezed.dart';

@freezed
sealed class TodoFormState with _$TodoFormState {
  const factory TodoFormState({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TodoFormState;

  factory TodoFormState.fromTodo(Todo todo) {
    return TodoFormState(
      id: todo.id,
      title: todo.title,
      description: todo.description ?? '',
      selectedDate: todo.date,
      selectedTime: todo.time?.toTimeOfDay(),
    );
  }
}

extension TodoFormStateX on TodoFormState {
  Todo toTodo() {
    return Todo(
      title: title,
      description: description.isEmpty ? null : description,
      date: selectedDate,
      time: selectedTime?.toTimeString(),
    );
  }
}
