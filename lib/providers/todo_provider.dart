import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app_riverpod/models/todo.dart';

part 'todo_provider.g.dart';

@riverpod
Future<Todo> todo(Ref ref) async {
  final response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/todos'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Todo.fromJson(json);
}
