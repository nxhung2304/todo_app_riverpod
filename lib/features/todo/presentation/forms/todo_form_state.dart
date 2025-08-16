import 'package:flutter/material.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/core/extensions/time_extension.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';

class TodoFormState {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<DateTime?> selectedDate;
  final ValueNotifier<TimeOfDay?> selectedTime;
  final ValueNotifier<Category?> selectedCategory;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<bool> isValid;
  final List<Category> categories;

  TodoFormState({
    required this.titleController,
    required this.descriptionController,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedCategory,
    required this.formKey,
    required this.isValid,
    required this.categories,
  });

  void validateForm() {
    final hasTitle = titleController.text.trim().isNotEmpty;
    final hasCategory = selectedCategory.value != null;
    final hasDate = selectedDate.value != null;

    isValid.value = hasTitle && hasCategory && hasDate;
  }

  void updateCategory(Category? category) {
    selectedCategory.value = category;
    validateForm();
  }

  void updateDate(DateTime? date) {
    selectedDate.value = date;
    validateForm();
  }

  void updateTime(TimeOfDay? time) {
    selectedTime.value = time;
    validateForm();
  }

  TodoParams toParams() {
    return TodoParams(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate.value,
      time: selectedTime.value?.toTimeString(),
      categoryId: selectedCategory.value?.id,
    );
  }

  void reset() {
    titleController.clear();
    descriptionController.clear();
    selectedDate.value = null;
    selectedTime.value = null;
    selectedCategory.value = null;
    isValid.value = false;
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    selectedDate.dispose();
    selectedTime.dispose();
    selectedCategory.dispose();
    isValid.dispose();
  }

  void fillFromTodo(Todo todo) {
    titleController.text = todo.title;
    descriptionController.text = todo.description ?? '';
    selectedDate.value = todo.date;
    selectedTime.value = todo.time?.toTimeOfDay();

    if (todo.categoryId != null) {
      final category = categories.firstWhere(
        (cat) => cat.id == todo.categoryId,
      );
      selectedCategory.value = category;
    }

    validateForm();
  }
}
