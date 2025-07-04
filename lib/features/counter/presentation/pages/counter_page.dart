import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/features/counter/providers/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
  
  void onIncrement() {
    ref.read(counterProvider.notifier).increment();
  }
  
  void onDecrement() {
    ref.read(counterProvider.notifier).decrement();

  }
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: onIncrement, child: Text("Increment")),
          ElevatedButton(onPressed: onDecrement, child: Text("Increment")),
          Text("Counter = ${counter.number.toString()}")
        ],
      ),
    );
  }
}
