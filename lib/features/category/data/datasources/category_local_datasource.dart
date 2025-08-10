import 'dart:convert';
import 'package:learn_riverpod/core/constants/storage_keys.dart';
import 'package:learn_riverpod/core/services/storage_service.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';

class CategoryLocalDataSource {
  final StorageService storageService;

  CategoryLocalDataSource({required this.storageService});

  Future<bool> saveCategories(List<Category> categories) async {
    try {
      final jsonList =
          categories.map((category) => jsonEncode(category.toJson())).toList();
      return await storageService.setStringList(StorageKeys.category, jsonList);
    } catch (e) {
      print('Error saving categories: $e');
      return false;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final jsonList = await storageService.getStringList(StorageKeys.category);
      if (jsonList == null) return [];

      return jsonList
          .map((jsonString) => Category.fromJson(jsonDecode(jsonString)))
          .toList();
    } catch (e) {
      print('Error getting categories: $e');
      return [];
    }
  }

  Future<bool> add(Category category) async {
    final categories = await getCategories();
    categories.add(category);
    return await saveCategories(categories);
  }

  Future<bool> update(Category updatedcategory) async {
    final categories = await getCategories();
    final index = categories.indexWhere(
      (category) => category.id == updatedcategory.id,
    );

    if (index != -1) {
      categories[index] = updatedcategory;
      return await saveCategories(categories);
    }

    return false;
  }

  Future<bool> delete(int id) async {
    final categories = await getCategories();
    categories.removeWhere((category) => category.id == id);
    return await saveCategories(categories);
  }

  Future<bool> clear() async {
    return await storageService.remove(StorageKeys.category);
  }
}
