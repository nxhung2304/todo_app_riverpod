// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  email: json['email'] as String?,
  fullName: json['fullName'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'email': instance.email,
  'fullName': instance.fullName,
  'id': instance.id,
};
