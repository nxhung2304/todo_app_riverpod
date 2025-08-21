import 'package:learn_riverpod/core/models/api_response.dart';

abstract class BaseRepository<T, Params> {
  Future<ApiResponse<List<T>>> all();
  Future<ApiResponse<T>> create(Params params);
  Future<ApiResponse<T>> update(int id, Params params);
  Future<ApiResponse<T>> delete(int id);
}
