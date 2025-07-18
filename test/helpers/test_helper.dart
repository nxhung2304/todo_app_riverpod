import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learn_riverpod/core/config/enviroment.dart';

class TestHelper {
  static Future<void> setupTestEnv() async {
    await dotenv.load(fileName: 'test/.env.test');
    Environment.initializeForTesting();
  }

  static void tearDownTestEnvironment() {
    dotenv.clean();
    Environment.resetForTesting();
  }

  static Map<String, dynamic> createSuccessResponse({
    required Map<String, dynamic> data,
    String message = 'Success',
    int statusCode = 200,
  }) {
    return {
      'success': true,
      'message': message,
      'data': data,
      'statusCode': statusCode,
    };
  }

  static void restoreAllEnvironmentVariables() {
    final defaultValues = {
      'API_BASE_URL': 'https://api-test.example.com',
      'API_TIMEOUT_CONNECT': '5',
      'API_TIMEOUT_RECEIVE': '5',
      'API_MAX_RETRIES': '1',
      'API_ENABLE_LOGGING': 'false',
      'API_CACHE_ENABLED': 'false',
      'API_CACHE_DURATION_MINUTES': '1',
      'AUTH_CLIENT_ID': 'test_client_id',
      'AUTH_CLIENT_SECRET': 'test_client_secret',
      'AUTH_TOKEN_REFRESH_THRESHOLD_MINUTES': '1',
      'DEBUG_MODE': 'true',
      'LOG_LEVEL': 'debug',
    };

    defaultValues.forEach((key, value) {
      TestHelper.overrideEnvVar(key, value);
    });
  }

  Future<Response> mockRequest({
    dynamic data,
    int statusCode = 200,
    String? errorCode,
  }) async => Response(
    requestOptions: RequestOptions(path: '/test'),
    statusCode: statusCode,
    data: data,
  );

  static void overrideEnvVar(String key, String value) {
    dotenv.env[key] = value;
  }

  static void removeEnvVar(String key) {
    dotenv.env.remove(key);
  }
}
