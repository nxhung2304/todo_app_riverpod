import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'package:learn_riverpod/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:learn_riverpod/features/auth/data/datasources/auth_local_datasource.dart';

part 'auth_datasource_providers.g.dart';

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource(storageService: ref.read(storageServiceProvider));
}

@riverpod
AuthRemoteDatasource authRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDatasource(apiClient: apiClient);
}
