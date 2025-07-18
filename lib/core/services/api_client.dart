import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/app_request.dart';
import 'package:learn_riverpod/core/services/intercepters/auth_intercepter.dart';
import 'package:learn_riverpod/core/services/intercepters/logging_intercepter.dart';
import 'package:learn_riverpod/core/services/network_connectivity.dart';
import 'package:learn_riverpod/core/utils/api_response.dart';

class ApiClient {
  late final Dio _dio;
  late final AppRequest appRequest;
  late final AppLogger appLogger;
  late final NetworkConnectivity networkConnectivity;

  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  ApiClient({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
  }) {
    appLogger = AppLogger();
    networkConnectivity = NetworkConnectivity();
    appRequest = AppRequest(
      appLogger: appLogger,
      networkConnectivity: networkConnectivity,
    );
    _initializedDio();
    _setupInterceptors();
  }

  _initializedDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );
  }

  void _setupInterceptors() {
    final loggingInterceptor = LoggingInterceptor(
      logger: appLogger,
      enableLogging: true,
    );

    final authInterceptor = AuthInterceptor(logger: appLogger);

    _dio.interceptors.addAll([loggingInterceptor, authInterceptor]);
  }

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    final request = _dio.get(endpoint, queryParameters: queryParameters);

    return appRequest.perform(() => request, fromJson);
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    final request = _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return appRequest.perform(() => request, fromJson);
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    final request = _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return appRequest.perform(() => request, fromJson);
  }

  Future<ApiResponse<T>> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    final request = _dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );

    return appRequest.perform(() => request, fromJson);
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    final request = _dio.delete(endpoint, queryParameters: queryParameters);

    return appRequest.perform(() => request, fromJson);
  }

  _setHeaders(Map<String, String>? customHeaders) {
    if (customHeaders != null) {
      _dio.options.headers.addAll(customHeaders);
    }
  }
}
