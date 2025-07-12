import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/services/storage_service.dart';
import '../../features/todo/data/datasources/todo_local_datasource.dart';
import '../../features/todo/data/repositories/todo_repository.dart';

part 'storage_provider.g.dart';

@riverpod
StorageService storageService(Ref ref) {
  return StorageService();
}

@riverpod
TodoLocalDataSource todoLocalDataSource(Ref ref) {
  return TodoLocalDataSource(
    storageService: ref.read(storageServiceProvider),
  );
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  return TodoRepository(
    localDataSource: ref.read(todoLocalDataSourceProvider),
  );
}
