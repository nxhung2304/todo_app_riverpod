import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/data/providers/todo_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  @override
  Future<List<Todo>> build() async {
    final repository = ref.read(todoRepositoryProvider);
    final response = await repository.getAll();

    if (response.isSuccess && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.error ?? 'Failed to load todos');
    }
  }

  Future<void> addTodo({
    required String title,
    String? description,
    TimeOfDay? time,
    DateTime? date,
  }) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(todoRepositoryProvider);

      final todoParams = TodoParams(
        title: title,
        description: description,
        dueDate: _combineDateAndTime(date, time),
      );

      final response = await repository.create(todoParams);

      if (response.isSuccess) {
        ref.invalidateSelf();
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> updateTodo({
    required int id,
    required String title,
    String? description,
    TimeOfDay? time,
    DateTime? date,
  }) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(todoRepositoryProvider);

      final todoParams = TodoParams(
        title: title,
        description: description,
        dueDate: _combineDateAndTime(date, time),
      );

      final response = await repository.update(id, todoParams);

      if (response.isSuccess) {
        ref.invalidateSelf();
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  String? _combineDateAndTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return null;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    return dateTime.toIso8601String();
  }

  Future<void> toggleTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      final response = await repository.toggleTodo(id);

      if (response.isSuccess) {
        ref.invalidateSelf();
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      final response = await repository.delete(id);

      if (response.isSuccess) {
        ref.invalidateSelf();
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
