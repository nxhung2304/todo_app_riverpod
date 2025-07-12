import 'package:flutter/material.dart';

import '../datasources/todo_local_datasource.dart';
import '../models/todo.dart';

class TodoRepository {
  final TodoLocalDataSource localDataSource;
  // TODO: Call API
  // final TodoRemoteDataSource remoteDataSource;

  TodoRepository({required this.localDataSource});

  Future<List<Todo>> getAllTodos() async {
    try {
      return localDataSource.getTodos();
    } catch (e) {
      throw Exception('Failed to get todos: $e');
    }
  }

  Future<Todo> addTodo({
    required String title,
    String? notes,
    TimeOfDay? time,
    DateTime? date,
  }) async {
    try {
      final id = await _autoId();

      final newTodo = Todo(
        userId: 1,
        id: id,
        title: title,
        notes: notes,
        time: _timeOfDayToString(time),
        date: date,
      );
      final success = await localDataSource.addTodo(newTodo);
      if (success) {
        return newTodo;
      } else {
        throw Exception('Failed to save todo');
      }
    } catch (e) {
      throw Exception('Failed to add todo: $e');
    }
  }

  Future<Todo> toggleTodo(int id) async {
    try {
      final todos = await localDataSource.getTodos();
      final todo = todos.firstWhere((t) => t.id == id);
      final updatedTodo = todo.copyWith(completed: !todo.completed);

      final success = await localDataSource.updateTodo(updatedTodo);
      if (success) {
        return updatedTodo;
      } else {
        throw Exception('Failed to update todo');
      }
    } catch (e) {
      throw Exception('Failed to toggle todo: $e');
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      return await localDataSource.deleteTodo(id);
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }

  String? _timeOfDayToString(TimeOfDay? time) {
    if (time == null) return null;
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<int> _autoId() async {
    final todos = await getAllTodos();

    return todos.length + 1;
  }
}
