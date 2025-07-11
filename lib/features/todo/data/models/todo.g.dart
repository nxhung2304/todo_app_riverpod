// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  userId: (json['userId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  notes: json['notes'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  time: json['time'] as String?,
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'title': instance.title,
  'notes': instance.notes,
  'date': instance.date?.toIso8601String(),
  'time': instance.time,
  'completed': instance.completed,
};
