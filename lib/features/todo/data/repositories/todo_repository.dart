import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';

import '../datasources/todo_local_datasource.dart';
import '../models/todo.dart';

class TodoRepository {
  final TodoLocalDataSource localDataSource;
  final TodoRemoteDataSource remoteDataSource;

  TodoRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<ApiResponse<List<Todo>>> all() async {
    try {
      final response = await remoteDataSource.all();
      if (response.isSuccess && response.data != null) {
        await localDataSource.saveTodos(response.data!);
        return response;
      }

      final localTodos = await localDataSource.all();
      return ApiResponse.success(localTodos);
    } catch (e) {
      final localTodos = await localDataSource.all();
      return ApiResponse.success(localTodos);
    }
  }

  Future<ApiResponse<Todo>> getById(int categoryId) async {
    try {
      final response = await remoteDataSource.getById(categoryId);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> create(TodoParams params) async {
    try {
      final response = await remoteDataSource.createTodo(params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> update(int id, TodoParams params) async {
    try {
      final response = await remoteDataSource.updateTodo(id, params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> delete(int id) async {
    try {
      final response = await remoteDataSource.deleteTodo(id);
      if (response.isSuccess) {
        await localDataSource.delete(id);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Todo>> toggleTodo(int id) async {
    try {
      final response = await remoteDataSource.toggleTodo(id);
      if (response.isSuccess && response.data != null) {
        await localDataSource.update(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
