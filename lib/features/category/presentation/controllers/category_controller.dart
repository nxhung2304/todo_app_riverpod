import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/data/providers/category_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  Future<List<Category>> build() async {
    return await _loadCategories();
  }

  Future<List<Category>> _loadCategories() async {
    final repository = ref.read(categoryRepositoryProvider);
    final response = await repository.all();

    if (response.isSuccess && response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.error ?? 'Failed to load todos');
    }
  }

  Future<ApiResponse<bool>> createCategory(
    CategoryParams categoryParams,
  ) async {
    print("Create a categorty with params: $categoryParams");
    try {
      final response = await ref
          .read(categoryRepositoryProvider)
          .create(categoryParams);
      if (response is ApiSuccess) {
        ref.invalidateSelf();

        return ApiResponse.success(true);
      }

      return ApiResponse.error("Failed to create category");
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<bool>> updateCategory(
    int categoryId,
    CategoryParams categoryParams,
  ) async {
    try {
      final response = await ref
          .read(categoryRepositoryProvider)
          .update(categoryId, categoryParams);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiResponse.success(true);
      }

      return ApiResponse.error("Failed to create category");
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<bool>> deleteCategory(int categoryId) async {
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final response = await repository.delete(categoryId);

      if (response.isSuccess) {
        ref.invalidateSelf();

        return ApiResponse.success(true);
      }

      return ApiResponse.error(response.error ?? "Failed to delete category");
    } catch (e) {
      return ApiResponse.error("Delete category error: ${e.toString()}");
    }
  }
}
