import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_provider.dart';
import 'package:learn_riverpod/features/todo/strings/todo_strings.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/todos/todo_item_widget.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class TodoPage extends LocalizedConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todoNotifierProvider);

    return SharedScaffold(
      body: Column(
        children: [
          _buildAddButton(context),
          Expanded(child: _buildTodoList(todosAsync, ref, context)),
        ],
      ),
      title: TodoStrings.title,
      currentRoute: AppRoutes.todo,
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => context.push(AppRoutes.newTodo),
        child: Text(TodoStrings.newTodo),
      ),
    );
  }

  Widget _buildTodoList(
    AsyncValue<List<dynamic>> todosAsync,
    WidgetRef ref,
    BuildContext context,
  ) {
    return todosAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: $error'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(todoNotifierProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
      data: (todos) => _buildTodoListView(todos, ref, context),
    );
  }

  Widget _buildTodoListView(
    List<dynamic> todos,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (todos.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];
        return TodoItemWidget(todo: todo, ref: ref);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            TodoStrings.noTodosYet,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(TodoStrings.needNewTodo, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
