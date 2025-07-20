import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final AppLogger logger;
  final TokenStorageService tokenStorageService;

  AuthInterceptor({required this.logger, required this.tokenStorageService});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokens = tokenStorageService.currentTokens;
    if (tokens != null) {
      options.headers.addAll({
        'access-token': tokens.accessToken,
        'client': tokens.client,
        'uid': tokens.uid,
      });
    }

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

  Future<void> _addBearerTokenToHeaders(RequestOptions options) async {
    // Add Bearer token to headers
    final tokens = await tokenStorageService.currentTokens;
    if (tokens != null) {
      options.headers.addAll({
        'access-token': tokens.accessToken,
        'client': tokens.client,
        'uid': tokens.uid,
      });
    }
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
