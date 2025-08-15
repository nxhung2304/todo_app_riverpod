import 'package:learn_riverpod/core/constants/api_endpoints.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/core/services/api_client.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';

class CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSource({required this.apiClient});

  Future<ApiResponse<List<Category>>> all() async {
    try {
      final response = await apiClient.get(ApiEndpoints.categories);
      final responseData = response.data;
      if (responseData['success'] == true && responseData['data'] != null) {
        final categories =
            (responseData['data'] as List)
                .map((json) => Category.fromJson(json))
                .toList();

        return ApiResponse.success(categories);
      } else {
        return ApiResponse.error(
          responseData['message'] ?? 'Failed to load categories',
        );
      }
    } catch (e) {
      print("[CategoryRemoteDataSource] Error fetching categories: $e");
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

  Future<ApiResponse<Category>> getById(int categoryId) async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.getCategoryById(categoryId),
      );
      final Map<String, dynamic> categoryJson =
          response.data['data'] as Map<String, dynamic>;
      final category = Category.fromJson(categoryJson);

      return ApiResponse.success(category);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> update(
    int categoryId,
    CategoryParams categoryParams,
  ) async {
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
