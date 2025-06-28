import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The homepage of our application
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
    Widget build(BuildContext context, WidgetRef ref) {
        final AsyncValue<Todo> todo = ref.watch(todoProvider);

        return Center(
          /// Since network-requests are asynchronous and can fail, we need to
          /// handle both error and loading states. We can use pattern matching for this.
          /// We could alternatively use `if (todo.isLoading) { ... } else if (...)`
          child: switch (todo) {
            AsyncData(:final value) => Text('Todo: ${value.todo}'),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          },
        );
      }
}
