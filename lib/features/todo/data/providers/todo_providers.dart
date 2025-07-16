import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/providers/storage_provider.dart';
import 'package:learn_riverpod/features/todo/data/datasources/todo_local_datasource.dart';
import 'package:learn_riverpod/features/todo/data/repositories/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_providers.g.dart';

@riverpod
TodoLocalDataSource todoLocalDataSource(Ref ref) {
  return TodoLocalDataSource(storageService: ref.read(storageServiceProvider));
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  return TodoRepository(localDataSource: ref.read(todoLocalDataSourceProvider));
}
