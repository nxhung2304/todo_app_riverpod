// lib/features/auth/providers/auth_repository_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:todo_app_riverpod/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:todo_app_riverpod/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todo_app_riverpod/features/auth/domain/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
FirebaseAuthDataSource firebaseAuthDataSource(Ref ref) {
  return FirebaseAuthDataSource();
}

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource();
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.read(firebaseAuthDataSourceProvider);
  final localDataSource = ref.read(authLocalDataSourceProvider);
  
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource, localDataSource: localDataSource,
  );
}
