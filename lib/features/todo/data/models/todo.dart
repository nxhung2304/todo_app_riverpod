import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
sealed class Todo with _$Todo {
  factory Todo({
    @Default(0) int id,
    required String title,
    String? description,
    @Default(false) bool done,
    int? priority,
    @JsonKey(name: 'priority_label') String? priorityLabel,
    @JsonKey(name: 'due_date') String? dueDate,
    String? color,
    String? reminder,
    @JsonKey(name: 'is_overdue') @Default(false) bool isOverdue,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,

    @JsonKey(includeFromJson: false, includeToJson: false) DateTime? date,
    @JsonKey(includeFromJson: false, includeToJson: false) String? time,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

extension TodoExtension on Todo {
  String? get combinedDueDate {
    if (date == null || time == null) return null;

    final timeParts = time!.split(':');
    final hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);

    final dateTime = DateTime(date!.year, date!.month, date!.day, hour, minute);

    return dateTime.toIso8601String();
  }

  Todo get withCombinedDueDate => copyWith(dueDate: combinedDueDate);
}
