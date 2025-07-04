import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/features/counter/data/models/counter_model.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  CounterModel build() {
    return CounterModel(number: 0);
  }

  void increment() {
    state = state.copyWith(number: state.number + 1);
  }

  void decrement() {
    state = state.copyWith(number: state.number - 1);
  }
}
