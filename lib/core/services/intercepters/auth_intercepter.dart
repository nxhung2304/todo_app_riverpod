import 'package:dio/dio.dart';
import 'package:learn_riverpod/core/services/app_logger.dart';
import 'package:learn_riverpod/core/services/token_storage_service.dart';
import 'package:learn_riverpod/core/providers/core_providers.dart';
import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';

class AuthInterceptor extends Interceptor {
  final AppLogger logger;
  final TokenStorageService tokenStorageService;
  final Ref ref;

  AuthInterceptor({
    required this.logger,
    required this.tokenStorageService,
    required this.ref,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storage = ref.read(storageServiceProvider);
    final tokenString = await storage.getString('auth_tokens');
    if (tokenString != null && tokenString.isNotEmpty) {
      final tokenJson = jsonDecode(tokenString) as Map<String, dynamic>;
      final tokens = AuthTokens.fromJson(tokenJson);
      if (_isTokenValid(tokens)) {
        options.headers.addAll({
          'access-token': tokens.accessToken,
          'client': tokens.client,
          'uid': tokens.uid,
          'token-type': tokens.tokenType,
          'expiry': tokens.expiry.toString(),
        });

        logger.debug('Auth headers added to request');
        logger.debug('Headers: ${options.headers}');
      } else {
        logger.warning('Token expired, should refresh');
        _refreshToken();
      }
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

  void _refreshToken() {
    // Implement token refresh logic
    // Update stored tokens
    // Handle refresh failures
  }

  bool _isTokenValid(AuthTokens tokens) {
    try {
      if (tokens.expiry == null || tokens.expiry == 0) {
        logger.warning('Token has no expiry date');
        return false;
      }

      final expiryDate = DateTime.fromMillisecondsSinceEpoch(
        tokens.expiry! * 1000,
      );
      final now = DateTime.now();
      final isValid = now.isBefore(expiryDate);

      logger.debug('Token expiry: $expiryDate, Now: $now, Valid: $isValid');
      return isValid;
    } catch (e) {
      logger.error('Error checking token validity: $e');
      return false;
    }
  }

  void _retryRequest() {}
}
