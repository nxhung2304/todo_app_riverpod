import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// Firebase User → Entity mapping
@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String email,
    required String password
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
