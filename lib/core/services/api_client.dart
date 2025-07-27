import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:learn_riverpod/core/exceptions/network_exception.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/app_request.dart';
import 'package:learn_riverpod/core/services/intercepters/auth_intercepter.dart';
import 'package:learn_riverpod/core/services/intercepters/logging_intercepter.dart';
import 'package:learn_riverpod/core/services/network_connectivity.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';
import 'package:learn_riverpod/features/auth/strings/auth_error_strings.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';

class ApiClient {
  late final Dio _dio;
  late final AppRequest appRequest;
  late final AppLogger appLogger;
  late final NetworkConnectivity networkConnectivity;
  late final TokenStorageService tokenStorageService;

  final String baseUrl;
  final Ref ref;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  ApiClient({
    required this.baseUrl,
    required this.ref,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
  }) {
    tokenStorageService = TokenStorageService();
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
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  void _setupInterceptors() {
    final loggingInterceptor = LoggingInterceptor(
      logger: appLogger,
      enableLogging: true,
    );

    final authInterceptor = AuthInterceptor(
      logger: appLogger,
      ref: ref,
      tokenStorageService: tokenStorageService,
    );

    _dio.interceptors.addAll([authInterceptor, loggingInterceptor]);
  }

  Future<Response> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    // _setHeaders(headers);

    try {
      await _checkNetwork();
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    // _setHeaders(headers);

    try {
      await _checkNetwork();

      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );

      return response;
    } on NetworkException catch (e) {
      rethrow;
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final errors = e.response?.data['errors'];

        late final List<String> localizedErrors;

        if (errors is Map) {
          final flatErrors = errors.values.expand((e) => e).toList();
          localizedErrors =
              flatErrors
                  .map((msg) => AuthErrorStrings.mapServerErrorToLocalized(msg))
                  .toList();
        } else if (errors is List) {
          localizedErrors =
              errors
                  .map((msg) => AuthErrorStrings.mapServerErrorToLocalized(msg))
                  .toList();
        } else {
          localizedErrors = ['Đã xảy ra lỗi không xác định'];
        }

        throw localizedErrors;
      }

      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _checkNetwork() async {
    final bool isConnectedNetwork = await networkConnectivity.isConnected();
    if (isConnectedNetwork) {
      return;
    }

    throw NetworkException.notConnected();
  }

  Future<Response> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    // _setHeaders(headers);

    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);

    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    _setHeaders(headers);
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  _setHeaders(Map<String, String>? customHeaders) {
    if (customHeaders != null) {
      _dio.options.headers.addAll(customHeaders);
    }
    print(_dio.options.headers);
  }

  void clearAuthHeaders() {
    _dio.options.headers.remove('access-token');
    _dio.options.headers.remove('client');
    _dio.options.headers.remove('uid');
    _dio.options.headers.remove('token-type');
  }
}
