import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/exceptions/server_exception.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/features/auth/data/models/requests/login_request.dart';
import 'package:learn_riverpod/features/auth/data/models/requests/signup_request.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasource({required this.apiClient});

  Future<AuthTokens> login(LoginRequest loginRequest) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.login,
        data: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return AuthTokens.fromDioHeaders(response.headers.map);
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred. Please try again. 22');
    }
  }

  Future<Map<String, dynamic>> signup(SignupRequest signupRequest) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.signup,
        data: signupRequest.toJson(),
      );
      final statusCode = response.statusCode;
      if (statusCode == 201) {
        print("Signup success");
      } else {
        throw Exception("Signup failed with status: $statusCode");
      }
      return response.data;
    } catch (e) {
      throw Exception("Cannot signup");
    }
  }

  Future<void> logout() async {
    try {
      final response = await apiClient.delete(ApiEndpoints.logout);
      print("Response = ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Logout success");
      } else {
        throw ServerException('Logout failed', 500);
      }
    } catch (e) {
      throw Exception("Cannot signOut");
    }
  }

  Future<dynamic> validateToken() async {
    try {
      final response = await apiClient.get(ApiEndpoints.validateToken);
      if (response.statusCode == 200) {
        print("Logout success");
        return response.data;
      } else {
        throw ServerException('Logout failed', 500);
      }
    } catch (e) {
      throw Exception("Cannot signOut");
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout';
      case DioExceptionType.connectionError:
        return 'Connection error';
      case DioExceptionType.badResponse:
        if (e.response?.data != null) {
          final errorData = e.response!.data;
          if (errorData is Map && errorData.containsKey('errors')) {
            return errorData['errors'].toString();
          }
        }
        return 'Server error: ${e.response?.statusCode}';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
