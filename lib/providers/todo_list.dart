import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/models/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'todo_list.g.dart';

@riverpod
class TodoList extends _$TodoList {
  final Dio _dio = Dio();
  @override
  List<Todo> build() {
    final fakeTodos = [
      Todo(id: 1, userId: 1, title: "Todo 1"),
      Todo(id: 2, userId: 2, title: "Todo 2"),
    ];

    return fakeTodos;
  }

  Future<void> addTodo(Todo newTodo) async {
    final response = await _dio.post(
      "https://jsonplaceholder.typicode.com/todos",
      data: newTodo.toJson()
    );

    
  }
}
