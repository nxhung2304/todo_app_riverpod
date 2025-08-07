import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';

class TodoRemoteDataSource {
  final ApiClient apiClient;

  TodoRemoteDataSource({required this.apiClient});

  Future<ApiResponse<List<Todo>>> getTodos() async {
    try {
      final response = await apiClient.get(ApiEndpoints.todos);
      final List<dynamic> todosJson = response.data['data'] as List<dynamic>;
      final todos = todosJson.map((todo) => Todo.fromJson(todo)).toList();

      return ApiResponse.success(todos);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> addTodo(TodoParams todoParams) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.todos,
        data: todoParams.toJson(),
      );
      final Map<String, dynamic> todoJson =
          response.data['data'] as Map<String, dynamic>;

      final todo = Todo.fromJson(todoJson);

      return ApiResponse.success(todo);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> updateTodo(
    int todoId,
    TodoParams todoParams,
  ) async {
    try {
      final response = await apiClient.patch(
        ApiEndpoints.updateTodo(todoId),
        data: todoParams.toJson(),
      );
      final Map<String, dynamic> todoJson =
          response.data['data'] as Map<String, dynamic>;

      final todo = Todo.fromJson(todoJson);

      return ApiResponse.success(todo);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> toggleTodo(int todoId) async {
    try {
      final response = await apiClient.post(ApiEndpoints.toggleTodo(todoId));

      final Map<String, dynamic> todoJson =
          response.data['data'] as Map<String, dynamic>;
      final toggledTodo = Todo.fromJson(todoJson);

      return ApiResponse.success(toggledTodo);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> deleteTodo(int todoId) async {
    try {
      final response = await apiClient.delete(ApiEndpoints.deleteTodo(todoId));

      final Map<String, dynamic> todoJson =
          response.data['data'] as Map<String, dynamic>;
      final toggledTodo = Todo.fromJson(todoJson);

      return ApiResponse.success(toggledTodo);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
