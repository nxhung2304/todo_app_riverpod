// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  userId: (json['userId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  completed: json['completed'] as bool,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'title': instance.title,
  'completed': instance.completed,
};
