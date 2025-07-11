import 'package:flutter/src/material/time.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    // TODO: read from API or Local storage
    return [];
  }

  void addTodo({
    required String title,
    String? notes,
    TimeOfDay? time,
    DateTime? date,
  }) {
    final newTodo = Todo(
      title: title,
      userId: 1,
      id: 1,
      notes: notes,
      time: _timeOfDayToString(time),
      date: date,
    );
    print(newTodo);

    state = [...state, newTodo];
  }

  void toggleTodo(int id) {
    state =
        state.map((todo) {
          if (todo.id == id) {
            return todo.copyWith(completed: !todo.completed);
          }

          return todo;
        }).toList();
  }

  void deleteTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  String? _timeOfDayToString(TimeOfDay? time) {
    if (time == null) return null;
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
