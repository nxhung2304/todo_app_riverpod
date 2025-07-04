import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_model.freezed.dart';
part 'counter_model.g.dart';

@freezed
sealed class CounterModel with _$CounterModel {
  factory CounterModel({
    required int number
  }) = _CounterModel;

  factory CounterModel.fromJson(Map<String, dynamic> json) => _$CounterModelFromJson(json);
}
