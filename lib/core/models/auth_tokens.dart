// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';
part 'auth_tokens.g.dart';

@freezed
sealed class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    @JsonKey(name: 'access-token') required String accessToken,
    required String client,
    required String uid,
    @JsonKey(name: 'token-type') String? tokenType,
    @JsonKey(name: 'expiry') int? expiry,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);

  factory AuthTokens.fromHeaders(Map<String, dynamic> headers) {
    return AuthTokens(
      accessToken: headers['access-token'] ?? '',
      client: headers['client'] ?? '',
      uid: headers['uid'] ?? '',
      tokenType: headers['token-type'] ?? 'Bearer',
      expiry: int.tryParse(headers['expiry']?.toString() ?? '0') ?? 0,
    );
  }

  factory AuthTokens.fromDioHeaders(Map<String, List<String>> headers) {
    return AuthTokens(
      accessToken: _getHeaderValue(headers, 'access-token') ?? '',
      client: _getHeaderValue(headers, 'client') ?? '',
      uid: _getHeaderValue(headers, 'uid') ?? '',
      tokenType: _getHeaderValue(headers, 'token-type') ?? 'Bearer',
      expiry: int.tryParse(_getHeaderValue(headers, 'expiry') ?? '0') ?? 0,
    );
  }

  static String? _getHeaderValue(
    Map<String, List<String>> headers,
    String key,
  ) {
    final values = headers[key];
    return values?.isNotEmpty == true ? values!.first : null;
  }
}
