import 'package:learn_riverpod/core/models/api_response.dart';
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
    final response = await repository.all();

    if (response.isSuccess && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.error ?? 'Failed to load todos');
    }
  }

  Future<ApiResponse<bool>> createTodo(TodoParams todoParams) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(todoRepositoryProvider);

      final response = await repository.create(todoParams);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        return ApiError(response.error.toString());
      }
    } catch (e) {
      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<bool>> updateTodo(
    int todoId,
    TodoParams todoParams,
  ) async {
    state = const AsyncLoading();

    try {
      final repository = ref.read(todoRepositoryProvider);
      final response = await repository.update(todoId, todoParams);

      if (response.isSuccess && response.data != null) {
        final currentTodos = state.valueOrNull ?? [];

        final updatedTodo = response.data!;

        final updatedTodos =
            currentTodos
                .map((todo) => todo.id == updatedTodo.id ? updatedTodo : todo)
                .toList();

        state = AsyncValue.data(updatedTodos);

        return ApiSuccess(true);
      } else {
        final errorMessage = response.error ?? 'Update failed';
        state = AsyncError(Exception(errorMessage), StackTrace.current);

        return ApiError(errorMessage);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }

  // String? _combineDateAndTime(DateTime? date, TimeOfDay? time) {
  //   if (date == null) return null;
  //
  //   final dateTime = DateTime(
  //     date.year,
  //     date.month,
  //     date.day,
  //     time?.hour ?? 0,
  //     time?.minute ?? 0,
  //   );
  //   return dateTime.toIso8601String();
  // }

  Future<ApiResponse<bool>> toggleTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      final response = await repository.toggleTodo(id);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);

        return ApiError(response.error.toString());
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<bool>> deleteTodo(int id) async {
    try {
      final repository = ref.read(todoRepositoryProvider);
      final response = await repository.delete(id);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiSuccess(true);
      } else {
        state = AsyncError(Exception(response.error), StackTrace.current);

        return ApiError(response.error.toString());
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);

      return ApiError(e.toString());
    }
  }
}
