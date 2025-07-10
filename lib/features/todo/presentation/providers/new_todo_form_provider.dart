import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_todo_form_provider.g.dart';

@riverpod
class NewTodoForm extends _$NewTodoForm {
  @override
  NewTodoFormState build() {
    return NewTodoFormState();
  }

  void updateTitle(String title) {
    print("updateTitle");
    state = state.copyWith(title: title);
  }

  void updateDate(DateTime? date) {
    print("updateDate");
    state = state.copyWith(selectedDate: date);
  }

  void updateTime(TimeOfDay? time) {
    print("updateTime");
    state = state.copyWith(selectedTime: time);
  }

  void updateNotes(String notes) {
    print("updateNotes");
    state = state.copyWith(notes: notes);
  }

  void reset() {
    state = NewTodoFormState();
  }
}

class NewTodoFormState {
  final String title;
  final String notes;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final bool isLoading;
  final String? errorMessage;

  const NewTodoFormState({
    this.title = '',
    this.notes = '',
    this.selectedDate,
    this.selectedTime,
    this.isLoading = false,
    this.errorMessage,
  });

  NewTodoFormState copyWith({
    String? title,
    String? notes,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? isLoading,
    String? errorMessage,
  }) {
    return NewTodoFormState(
      title: title ?? this.title,
      notes: notes ?? this.notes,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class FormValidationResult {
  final bool isValid;
  final List<String> errors;

  const FormValidationResult({required this.isValid, required this.errors});
}
