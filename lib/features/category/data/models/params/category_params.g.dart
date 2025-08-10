// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryParams _$CategoryParamsFromJson(Map<String, dynamic> json) =>
    _CategoryParams(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CategoryParamsToJson(_CategoryParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'icon': instance.icon,
    };
