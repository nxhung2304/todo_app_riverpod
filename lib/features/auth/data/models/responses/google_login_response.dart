// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_riverpod/core/models/auth_tokens.dart';
import 'package:learn_riverpod/features/auth/data/models/user.dart';

part "google_login_response.freezed.dart";
part "google_login_response.g.dart";

@freezed
sealed class GoogleLoginResponse with _$GoogleLoginResponse {
  const factory GoogleLoginResponse({
    required bool success,
    required User user,
    @JsonKey(name: 'auth_tokens') required AuthTokens authTokens,
    String? message,
  }) = _GoogleLoginResponse;

  factory GoogleLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginResponseFromJson(json);
}
