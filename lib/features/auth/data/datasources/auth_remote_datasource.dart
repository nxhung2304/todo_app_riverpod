import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/exceptions/server_exception.dart';
import 'package:learn_riverpod/core/services/api_client.dart';

class AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasource({required this.apiClient});

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.login,
        data: {email: email, password: password},
      );
      print(response);
      return response.data;
    } catch (e) {
      print(e);
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Future<Map<String, dynamic>> signup(
    String fullName, {
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.signup,
        data: {email: email, password: password},
      );
      print(response);
      return response.data;
    } catch (e) {
      throw Exception("Cannot signup");
    }
  }

  Future<void> logout() async {
    try {
      final response = await apiClient.delete(ApiEndpoints.logout);
      if (!response.isSuccess) {
        throw ServerException(response.error ?? 'Logout failed', 500);
      }
    } catch (e) {
      throw Exception("Cannot signOut");
    }
  }
}
