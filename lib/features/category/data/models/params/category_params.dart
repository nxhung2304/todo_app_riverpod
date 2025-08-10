import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_params.freezed.dart';
part 'category_params.g.dart';

@freezed
sealed class CategoryParams with _$CategoryParams {
  const factory CategoryParams({
    int? id,
    required String name,
    String? color,
    String? icon,
  }) = _CategoryParams;

  factory CategoryParams.fromJson(Map<String, dynamic> json) =>
      _$CategoryParamsFromJson(json);
}
