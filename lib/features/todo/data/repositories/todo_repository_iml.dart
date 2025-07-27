import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/domain/repositories/todo_repository.dart';

import '../datasources/todo_local_datasource.dart';
import '../models/todo.dart';

class TodoRepositoryIml implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryIml({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<ApiResponse<List<Todo>>> getAll() async {
    try {
      final response = await remoteDataSource.getTodos();
      if (response.isSuccess && response.data != null) {
        await localDataSource.saveTodos(response.data!);
        return response;
      }

      final localTodos = await localDataSource.getTodos();
      return ApiResponse.success(localTodos);
    } catch (e) {
      final localTodos = await localDataSource.getTodos();
      return ApiResponse.success(localTodos);
    }
  }

  @override
  Future<ApiResponse<Todo>> create(TodoParams params) async {
    try {
      final response = await remoteDataSource.addTodo(params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.addTodo(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<Todo>> update(int id, TodoParams params) async {
    try {
      final response = await remoteDataSource.updateTodo(id, params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.addTodo(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<Todo>> delete(int id) async {
    try {
      final response = await remoteDataSource.deleteTodo(id);
      if (response.isSuccess) {
        await localDataSource.deleteTodo(id);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<Todo>> toggleTodo(int id) async {
    try {
      final response = await remoteDataSource.toggleTodo(id);
      if (response.isSuccess && response.data != null) {
        await localDataSource.updateTodo(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
