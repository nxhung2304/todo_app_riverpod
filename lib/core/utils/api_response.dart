import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T data) = ApiSuccess<T>;
  const factory ApiResponse.error(String message) = ApiError<T>;

  const ApiResponse._();

  bool get isSuccess => this is ApiSuccess<T>;
  bool get isError => this is ApiError<T>;

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);

  String? get error =>
      maybeWhen(error: (message) => message, orElse: () => null);
}
