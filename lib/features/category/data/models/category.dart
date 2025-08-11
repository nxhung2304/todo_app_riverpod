import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'icon') String? icon,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'archived') required bool archived,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
