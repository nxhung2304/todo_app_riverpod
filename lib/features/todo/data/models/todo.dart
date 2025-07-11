import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
sealed class Todo with _$Todo {
  factory Todo({
    required int userId,
    required int id,
    required String title,
    
    String? notes,
    DateTime? date,
    String? time,
    @Default(false) bool completed,
  }) = _Todo;
  
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
