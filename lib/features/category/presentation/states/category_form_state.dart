import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_form_state.freezed.dart';

@freezed
sealed class CategoryFormState with _$CategoryFormState {
  const factory CategoryFormState({
    required String name,
    String? color,
    String? icon,
    @Default(false) bool isLoading,
  }) = _CategoryFormState;
}
