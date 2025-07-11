import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_todo_provider.g.dart';

@riverpod
class SubmitTodo extends _$SubmitTodo {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> submit({
    required String title,
    required DateTime? date,
    required TimeOfDay? time,
    required String? notes,
  }) async {
    try {
      state = const AsyncValue.loading();

      final todoList = ref.read(todoListProvider.notifier);
      todoList.addTodo(title: title, notes: notes, time: time, date: date);

      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
