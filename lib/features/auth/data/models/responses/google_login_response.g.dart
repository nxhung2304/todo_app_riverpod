// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleLoginResponse _$GoogleLoginResponseFromJson(Map<String, dynamic> json) =>
    _GoogleLoginResponse(
      success: json['success'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      authTokens: AuthTokens.fromJson(
        json['auth_tokens'] as Map<String, dynamic>,
      ),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GoogleLoginResponseToJson(
  _GoogleLoginResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'user': instance.user,
  'auth_tokens': instance.authTokens,
  'message': instance.message,
};
