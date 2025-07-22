// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthTokens _$AuthTokensFromJson(Map<String, dynamic> json) => _AuthTokens(
  accessToken: json['accessToken'] as String,
  client: json['client'] as String,
  uid: json['uid'] as String,
  tokenType: json['tokenType'] as String,
  expiry: (json['expiry'] as num).toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AuthTokensToJson(_AuthTokens instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'client': instance.client,
      'uid': instance.uid,
      'tokenType': instance.tokenType,
      'expiry': instance.expiry,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
