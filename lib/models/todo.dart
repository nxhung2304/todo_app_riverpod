import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// The response of the `GET /todos` endpoint.
///
/// It is defined using `freezed` and `json_serializable`.
@freezed
sealed class Todo with _$Todo {
  factory Todo({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) = _Todo;

  /// Convert a JSON object into an [Todo] instance.
  /// This enables type-safe reading of the API response.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
