import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_params.freezed.dart';
part 'signup_params.g.dart';

@freezed
sealed class SignupParams with _$SignupParams {
  const factory SignupParams({
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    required String password,
  }) = _SignupParams;

  factory SignupParams.fromJson(Map<String, dynamic> json) =>
      _$SignupParamsFromJson(json);
}
