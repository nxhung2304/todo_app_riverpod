import 'dart:convert';
import 'package:learn_riverpod/core/constants/storage_keys.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';

import '../models/todo.dart';

class TodoLocalDataSource {
  final StorageService storageService;
  // storageService.init();
  
  TodoLocalDataSource({required this.storageService});
  
  Future<bool> saveTodos(List<Todo> todos) async {
    try {
      final jsonList = todos.map((todo) => jsonEncode(todo.toJson())).toList();
      return await storageService.setStringList(StorageKeys.todos, jsonList);
    } catch (e) {
      print('Error saving todos: $e');
      return false;
    }
  }
  
  Future<List<Todo>> getTodos() async{
    try {
      final jsonList = await storageService.getStringList(StorageKeys.todos);
      if (jsonList == null) return [];
      
      return jsonList
          .map((jsonString) => Todo.fromJson(jsonDecode(jsonString)))
          .toList();
    } catch (e) {
      print('Error getting todos: $e');
      return [];
    }
  }
  
  Future<bool> addTodo(Todo todo) async {
    final todos = await getTodos();
    todos.add(todo);
    return await saveTodos(todos);
  }
  
  Future<bool> updateTodo(Todo updatedTodo) async {
    final todos = await getTodos();
    final index = todos.indexWhere((todo) => todo.id == updatedTodo.id);
    
    if (index != -1) {
      todos[index] = updatedTodo;
      return await saveTodos(todos);
    }
    
    return false;
  }
  
  Future<bool> deleteTodo(int id) async {
    final todos = await getTodos();
    todos.removeWhere((todo) => todo.id == id);
    return await saveTodos(todos);
  }
  
  Future<bool> clearTodos() async {
    return await storageService.remove(StorageKeys.todos);
  }
}
