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

  void addTodo({required String title}) {
    final newTodo = Todo(title: title, userId: 1, id: 1);
    print(newTodo);

    state = [...state, newTodo];
  }
}
