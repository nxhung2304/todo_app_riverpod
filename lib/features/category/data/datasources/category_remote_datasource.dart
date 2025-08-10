import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';

class CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSource({required this.apiClient});

  Future<ApiResponse<List<Category>>> getCategories() async {
    try {
      final response = await apiClient.get(ApiEndpoints.categories);
      final List<dynamic> categoriesJson =
          response.data['data'] as List<dynamic>;
      final categories =
          categoriesJson.map((todo) => Category.fromJson(todo)).toList();

      return ApiResponse.success(categories);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> create(CategoryParams categoryParams) async {
    try {
      final response = await apiClient.post(
        ApiEndpoints.categories,
        data: categoryParams.toJson(),
      );
      final Map<String, dynamic> categoryJson =
          response.data['data'] as Map<String, dynamic>;
      final category = Category.fromJson(categoryJson);

      return ApiResponse.success(category);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> getById(String categoryId) async {
    try {
      final response = await apiClient.get(ApiEndpoints.getCategoryById(categoryId));
      final Map<String, dynamic> categoryJson =
          response.data['data'] as Map<String, dynamic>;
      final category = Category.fromJson(categoryJson);

      return ApiResponse.success(category);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> update(int categoryId, CategoryParams categoryParams) async {
    try {
      final response = await apiClient.put(
        ApiEndpoints.updateCategory(categoryId),
        data: categoryParams.toJson(),
      );
    final Map<String, dynamic> categoryJson =
          response.data['data'] as Map<String, dynamic>;
      final category = Category.fromJson(categoryJson);


      return ApiResponse.success(category);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> delete(int categoryId) async {
    try {
      final response = await apiClient.delete(
        ApiEndpoints.deleteCategory(categoryId),
      );

      final Map<String, dynamic> categoryJson =
          response.data['data'] as Map<String, dynamic>;
      final deletedCategory = Category.fromJson(categoryJson);

      return ApiResponse.success(deletedCategory);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
