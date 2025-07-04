import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/models/todo.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(String title) {}

  void toggleTodo(String id) {}

  void deleteTodo(String id) {}
}
