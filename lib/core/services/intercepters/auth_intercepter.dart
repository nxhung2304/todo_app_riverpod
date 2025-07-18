import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';

class AuthInterceptor extends Interceptor {
  final AppLogger logger;

  AuthInterceptor({required this.logger});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _addBearerTokenToHeaders();
    final isExpired = _isTokenExpiration();
    if (isExpired) {
      _refreshToken();
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final isAuthorized = err.response?.statusCode == 401;
    if (isAuthorized) {
      _refreshToken();
    }

    // Retry original request với new token
    _retryRequest();

    return handler.next(err);
  }

  void _addBearerTokenToHeaders() {
    // Add Bearer token to headers
  }

  void _refreshToken() {
    // Implement token refresh logic
    // Update stored tokens
    // Handle refresh failures
  }

  bool _isTokenExpiration() {
    return false;
  }

  void _retryRequest() {}
}
