import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'package:learn_riverpod/features/category/data/datasources/category_local_datasource.dart';
import 'package:learn_riverpod/features/category/data/datasources/category_remote_datasource.dart';
import 'package:learn_riverpod/features/category/data/repositories/category_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_providers.g.dart';

@riverpod
CategoryLocalDataSource categoryLocalDataSource(Ref ref) {
  return CategoryLocalDataSource(storageService: ref.read(storageServiceProvider));
}

@riverpod
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  return CategoryRemoteDataSource(apiClient: ref.read(apiClientProvider));
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final local = ref.watch(categoryLocalDataSourceProvider);
  final remote = ref.watch(categoryRemoteDataSourceProvider);

  return CategoryRepository(localDataSource: local, remoteDataSource: remote);
}
