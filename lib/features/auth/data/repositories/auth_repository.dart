import 'package:learn_riverpod/core/utils/result.dart';
import 'package:learn_riverpod/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:learn_riverpod/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDatasource remoteDataSource;

  AuthRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<void> signup(
    String fullName, {
    required String email,
    required String password,
  }) async {
    try {
      final userJson = await remoteDataSource.signup(
        fullName,
        email: email,
        password: password,
      );

      final user = User.fromJson(userJson);
      localDataSource.saveCurrentUser(user);
    } catch (e) {
      print(e);
    }
  }

  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userJson = await remoteDataSource.login(
        email: email,
        password: password,
      );
      final user = User.fromJson(userJson);
      await localDataSource.saveCurrentUser(user);

      return Result.success(user);
    } catch (e) {
      return Result.failure(
        e.toString().replaceFirst('Exception: ', ''),
        e is Exception ? e : Exception(e.toString()),
      );
    }
  }

  Future<void> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.removeCurrentUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final savedUser = await localDataSource.getCurrentUser();
      if (savedUser == null) {
        return null;
      }

      return savedUser;
    } catch (e) {
      throw Exception("Erorr: $e");
    }
  }
}
