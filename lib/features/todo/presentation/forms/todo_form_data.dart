import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';

class TodoFormData {
  final List<Category> categories;
  final Todo? todo;

  const TodoFormData({required this.categories, this.todo});

  factory TodoFormData.empty() => TodoFormData(categories: []);

  bool get isEdit => todo != null;
}
