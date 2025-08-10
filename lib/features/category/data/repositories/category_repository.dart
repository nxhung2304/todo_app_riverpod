import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/features/category/data/datasources/category_remote_datasource.dart';
import 'package:learn_riverpod/features/category/data/datasources/category_local_datasource.dart';

import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';

class CategoryRepository{
  final CategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;

  CategoryRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  Future<ApiResponse<List<Category>>> getCategories() async {
    try {
      final response = await remoteDataSource.getCategories();
      if (response.isSuccess && response.data != null) {
        await localDataSource.saveCategories(response.data!);
        return response;
      }

      final localCategorys = await localDataSource.getCategories();
      return ApiResponse.success(localCategorys);
    } catch (e) {
      final localCategorys = await localDataSource.getCategories();
      return ApiResponse.success(localCategorys);
    }
  }

  Future<ApiResponse<Category>> getById(String categoryId) async {
    try {
      final response = await remoteDataSource.getById(categoryId);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> create(CategoryParams params) async {
    try {
      final response = await remoteDataSource.create(params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }


  Future<ApiResponse<Category>> update(int id, CategoryParams params) async {
    try {
      final response = await remoteDataSource.update(id, params);
      if (response.isSuccess && response.data != null) {
        await localDataSource.add(response.data!);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Category>> delete(int id) async {
    try {
      final response = await remoteDataSource.delete(id);
      if (response.isSuccess) {
        await localDataSource.delete(id);
      }
      return response;
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
