import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'package:learn_riverpod/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:learn_riverpod/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/data/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_providers.g.dart';

@riverpod
TodoLocalDataSource todoLocalDataSource(Ref ref) {
  return TodoLocalDataSource(storageService: ref.read(storageServiceProvider));
}

@riverpod
TodoRemoteDataSource todoRemoteDataSource(Ref ref) {
  return TodoRemoteDataSource(apiClient: ref.read(apiClientProvider));
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  final local = ref.watch(todoLocalDataSourceProvider);
  final remote = ref.watch(todoRemoteDataSourceProvider);

  return TodoRepository(localDataSource: local, remoteDataSource: remote);
}

final todoByIdProvider = FutureProvider.family<ApiResponse<Todo>, int>((
  ref,
  id,
) {
  return ref.read(todoRepositoryProvider).getById(id);
});
