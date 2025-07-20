import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/exceptions/network_exception.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/network_connectivity.dart';

class AppRequest {
  final AppLogger _appLogger;
  final NetworkConnectivity _networkConnectivity;

  AppRequest({
    required AppLogger appLogger,
    required NetworkConnectivity networkConnectivity,
  }) : _appLogger = appLogger,
       _networkConnectivity = networkConnectivity;

  Future<ApiResponse<T>> perform<T>(
    Future<Response> Function() request,
    T Function(Map<String, dynamic>)? fromJson,
  ) async {
    try {
      await _checkNetwork();

      final response = await request();
      return _handleResponse(response, fromJson);
    } on NetworkException catch (e) {
      return ApiResponse.error(e.message);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResponse.error('Unexpected error: ${e.toString()}');
    }
  }

  Future<void> _checkNetwork() async {
    final bool isConnectedNetwork = await _networkConnectivity.isConnected();
    if (isConnectedNetwork) {
      return;
    }

    throw NetworkException.notConnected();
  }

  ApiResponse<T> _handleDioError<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiResponse.error('Connection timeout');
      case DioExceptionType.receiveTimeout:
        return ApiResponse.error('Receive timeout');
      case DioExceptionType.badResponse:
        return ApiResponse.error('Server error: ${error.response?.statusCode}');
      default:
        return ApiResponse.error('Network error: ${error.message}');
    }
  }

  ApiResponse<T> _handleResponse<T>(
    Response response,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (fromJson != null && response.data != null) {
        try {
          final parsedData = fromJson(response.data);
          return ApiResponse.success(parsedData);
        } catch (e) {
          _appLogger.error('Failed to parse response', data: e);
          return ApiResponse.error('Failed to parse response: $e');
        }
      }
      return ApiResponse.success(response.data);
    }
    return ApiResponse.error('HTTP ${response.statusCode}');
  }
}
