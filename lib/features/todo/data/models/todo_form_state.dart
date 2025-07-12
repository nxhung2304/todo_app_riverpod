import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/core/extensions/time_extension.dart';

class TodoFormState {
  final String title;
  final String notes;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final bool isLoading;
  final String? errorMessage;

  const TodoFormState({
    this.title = '',
    this.notes = '',
    this.selectedDate,
    this.selectedTime,
    this.isLoading = false,
    this.errorMessage,
  });

  TodoFormState copyWith({
    String? title,
    String? notes,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TodoFormState(
      title: title ?? this.title,
      notes: notes ?? this.notes,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory TodoFormState.fromTodo(Todo todo) {
    return TodoFormState(
      title: todo.title,
      notes: todo.notes ?? '',
      selectedDate: todo.date,
      selectedTime: todo.time.toTimeOfDay(),
    );
  }

  Todo toTodo({int? id, int? userId}) {
    return Todo(
      id: id ?? DateTime.now().millisecondsSinceEpoch,
      userId: userId ?? 1,
      title: title,
      notes: notes.isEmpty ? null : notes,
      date: selectedDate,
      time: selectedTime?.toTimeString(),
    );
  }
}
