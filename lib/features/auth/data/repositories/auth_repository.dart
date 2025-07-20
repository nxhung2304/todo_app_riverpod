import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:learn_riverpod/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:learn_riverpod/features/auth/data/models/requests/login_request.dart';
import 'package:learn_riverpod/features/auth/data/models/requests/signup_request.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDatasource remoteDataSource;

  AuthRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<ApiResponse<void>> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final signupRequest = SignupRequest(
        fullName: fullName,
        email: email,
        password: password,
      );
      final userJson = await remoteDataSource.signup(signupRequest);
      return ApiResponse.success("Suggess");
    } catch (e) {
      print(e);
      return ApiResponse.error(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<ApiResponse<AuthTokens>> login(LoginRequest loginRequest) async {
    try {
      final authToken = await remoteDataSource.login(loginRequest);

      return ApiResponse.success(authToken);
    } catch (e) {
      return ApiResponse.error(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<ApiResponse<void>> logout() async {
    try {
      await remoteDataSource.logout();
      await localDataSource.removeCurrentUser();

      return ApiResponse.success("Logout success");
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<User>> validateToken() async {
    try {
      final user = await remoteDataSource.validateToken();

      return ApiResponse.success(user);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
