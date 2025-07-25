import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/exceptions/server_exception.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/features/auth/data/models/params/google_token_params.dart';
import 'package:learn_riverpod/features/auth/data/models/params/login_params.dart';
import 'package:learn_riverpod/features/auth/data/models/params/signup_params.dart';
import 'package:learn_riverpod/features/auth/data/models/responses/google_login_response.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

class AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasource({required this.apiClient});

  Future<AuthTokens> login(LoginParams loginParams) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.login,
        data: loginParams.toJson(),
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

  Future<Map<String, dynamic>> signup(SignupParams signupParams) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.signup,
        data: signupParams.toJson(),
      );
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        print("Signup success");
      } else {
        throw Exception("Signup failed with status: $statusCode");
      }
      return response.data;
    } catch (e) {
      throw Exception("Cannot signup: ${e.toString()}");
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

  Future<ApiResponse<User>> validateToken() async {
    try {
      final response = await apiClient.get(ApiEndpoints.validateToken);

      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data as Map<String, dynamic>;

        final userData = responseData['data'] ?? responseData;
        final user = User.fromJson(userData as Map<String, dynamic>);

        print('Parsed user: $user');

        return ApiSuccess(user);
      } else {
        return ApiError('Validation failed');
      }
    } catch (e) {
      print('validateToken error: $e');
      print('Error type: ${e.runtimeType}');
      return ApiError(e.toString());
    }
  }

  Future<ApiResponse<GoogleLoginResponse>> verifyGoogleToken(
    GoogleTokenParams googleTokenParams,
  ) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.googleLogin,
        data: googleTokenParams.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        final googleResponseJson = response.data as Map<String, dynamic>;
        final googleResponse = GoogleLoginResponse.fromJson(googleResponseJson);

        return ApiSuccess(googleResponse);
      } else {
        return ApiError('Validation failed');
      }
    } catch (e) {
      print('validateToken error: $e');
      print('Error type: ${e.runtimeType}');
      return ApiError(e.toString());
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
