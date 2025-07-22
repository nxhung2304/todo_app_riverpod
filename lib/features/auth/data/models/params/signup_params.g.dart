// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupParams _$SignupParamsFromJson(Map<String, dynamic> json) =>
    _SignupParams(
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignupParamsToJson(_SignupParams instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
    };
