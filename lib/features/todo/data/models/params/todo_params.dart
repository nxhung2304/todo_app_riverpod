import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/core/extensions/time_of_day_extension.dart';

part 'todo_params.freezed.dart';
part 'todo_params.g.dart';

@freezed
sealed class TodoParams with _$TodoParams {
  const factory TodoParams({
    required String title,
    String? description,
    String? time,
    DateTime? date,
    @JsonKey(name: 'due_date') String? dueDate,
  }) = _TodoParams;

  factory TodoParams.fromJson(Map<String, dynamic> json) =>
      _$TodoParamsFromJson(json);
}

extension TodoParamsExtension on TodoParams {
  TimeOfDay? get timeOfDay {
    return time?.toTimeOfDay();
  }

  TodoParams copyWithTimeOfDay(TimeOfDay? timeOfDay) {
    return copyWith(time: timeOfDay?.toFormattedString());
  }
}
