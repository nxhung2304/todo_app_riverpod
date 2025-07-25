import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_token_params.freezed.dart';
part 'google_token_params.g.dart';

@freezed
sealed class GoogleTokenParams with _$GoogleTokenParams {
  const factory GoogleTokenParams({
    @JsonKey(name: 'id_token') required String idToken,
  }) = _GoogleTokenParams;

  factory GoogleTokenParams.fromJson(Map<String, dynamic> json) =>
      _$GoogleTokenParamsFromJson(json);
}
