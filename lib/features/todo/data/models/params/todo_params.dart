import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_params.freezed.dart';
part 'todo_params.g.dart';

@freezed
sealed class TodoParams with _$TodoParams {
  const factory TodoParams({
    required String title,
    String? description,
    String? time,
    DateTime? date,
    String? dueDate,
  }) = _TodoParams;

  factory TodoParams.fromJson(Map<String, dynamic> json) =>
      _$TodoParamsFromJson(json);
}

extension TodoParamsExtension on TodoParams {
  TimeOfDay? get timeOfDay {
    if (time == null) return null;
    final parts = time!.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  TodoParams copyWithTimeOfDay(TimeOfDay? timeOfDay) {
    return copyWith(
      time:
          timeOfDay != null
              ? '${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}'
              : null,
    );
  }
}
