import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/data/providers/todo_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Future<List<Todo>> build() async {
    final repository = ref.read(todoRepositoryProvider);
    return await repository.getAllTodos();
  }

  Future<void> addTodo({
    required String title,
    String? notes,
    TimeOfDay? time,
    DateTime? date,
  }) async {

    state = const AsyncLoading();

    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.addTodo(title: title, notes: notes, time: time, date: date);

      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void toggleTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.toggleTodo(id);
      
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

   Future<void> deleteTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      await repository.deleteTodo(id);
      
      ref.invalidateSelf();
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
