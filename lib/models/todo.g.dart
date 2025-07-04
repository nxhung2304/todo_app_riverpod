// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  userId: (json['userId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  todo: json['todo'] as String,
  completed: json['completed'] as bool,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'todo': instance.todo,
  'completed': instance.completed,
};
