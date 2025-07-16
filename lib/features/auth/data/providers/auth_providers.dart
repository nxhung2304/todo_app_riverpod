import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/providers/storage_provider.dart';
import 'package:learn_riverpod/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:learn_riverpod/features/auth/data/datasources/auth_local_datasource.dart';

part 'auth_providers.g.dart';

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource(storageService: ref.read(storageServiceProvider));
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    authLocalDataSource: ref.read(authLocalDataSourceProvider),
  );
}
