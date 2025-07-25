// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokens _$AuthTokensFromJson(Map<String, dynamic> json) => _AuthTokens(
  accessToken: json['access-token'] as String,
  client: json['client'] as String,
  uid: json['uid'] as String,
  tokenType: json['token-type'] as String?,
  expiry: (json['expiry'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthTokensToJson(_AuthTokens instance) =>
    <String, dynamic>{
      'access-token': instance.accessToken,
      'client': instance.client,
      'uid': instance.uid,
      'token-type': instance.tokenType,
      'expiry': instance.expiry,
    };
