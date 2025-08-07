// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String,
  description: json['description'] as String?,
  done: json['done'] as bool? ?? false,
  priority: (json['priority'] as num?)?.toInt(),
  priorityLabel: json['priority_label'] as String?,
  dueDate: json['due_date'] as String?,
  color: json['color'] as String?,
  reminder: json['reminder'] as String?,
  isOverdue: json['is_overdue'] as bool? ?? false,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'done': instance.done,
  'priority': instance.priority,
  'priority_label': instance.priorityLabel,
  'due_date': instance.dueDate,
  'color': instance.color,
  'reminder': instance.reminder,
  'is_overdue': instance.isOverdue,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
