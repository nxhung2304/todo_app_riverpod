import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/repositories/base_repository.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';

abstract class TodoRepository extends BaseRepository<Todo, TodoParams> {
  Future<ApiResponse<Todo>> toggleTodo(int todoId);
}
