import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
sealed class SignupRequest with _$SignupRequest {
  const factory SignupRequest({
    required String fullName,
    required String email,
    required String password,
  }) = _LoginRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
