import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/data/providers/category_providers.dart';
import 'package:learn_riverpod/features/category/presentation/states/category_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  CategoryFormState build(String? categoryId) {
    if (categoryId != null) {
      _loadCategoryForEdit(categoryId);
    }

    return CategoryFormState(name: "", color: "", icon: "");
  }

  Future<void> _loadCategoryForEdit(String categoryId) async {
    try {
      final response = await ref.read(categoryRepositoryProvider).getById(categoryId);
      final category = response.data;

      if (category == null) {
        return;
      }

      state = state.copyWith(
        name: category.name,
        icon: category.icon,
        color: category.color,
      );
    } catch (e) {
      // state = state.copyWith(error: e.toString(), isLoading: false);
      print(e);
    }
  }

  Future<void> create(CategoryParams categoryParams) async {
    print("Create a categorty with params: $categoryParams");
  }

  Future<void> update(CategoryParams categoryParams) async {
    print("Update a category with ID: $categoryId with params: $categoryParams");
  }
}
