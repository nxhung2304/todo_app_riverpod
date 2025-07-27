// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoParams _$TodoParamsFromJson(Map<String, dynamic> json) => _TodoParams(
  title: json['title'] as String,
  description: json['description'] as String?,
  time: json['time'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  dueDate: json['dueDate'] as String?,
);

Map<String, dynamic> _$TodoParamsToJson(_TodoParams instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'date': instance.date?.toIso8601String(),
      'dueDate': instance.dueDate,
    };
