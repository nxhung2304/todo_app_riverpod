import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/auth/data/providers/auth_datasource_providers.dart';
import 'package:learn_riverpod/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    localDataSource: ref.read(authLocalDataSourceProvider),
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
  );
}
