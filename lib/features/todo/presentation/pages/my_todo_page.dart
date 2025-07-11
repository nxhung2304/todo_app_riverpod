import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_bottom_nav.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_list_provider.dart';

class MyTodoPage extends HookConsumerWidget with RouteAware {
  const MyTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
  
    print("TodoList = ${todoList}");

    return Scaffold(
      appBar: SharedAppBar(title: 'My todo'),
      bottomNavigationBar: SharedBottomNav(currentRoute: '/todo'),
      body: Column(
        children: [
          TextButton(
            child: Text("Add new"),
            onPressed: () {
              context.push(AppRoutes.newTodo);
            },
          ),
          Expanded(child: _buildTodoList(todoList, ref)),
        ],
      ),
    );
  }

  Widget _buildTodoList(List<Todo> todos, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (value) {
                ref.read(todoListProvider.notifier).toggleTodo(todo.id);
              },
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration:
                    todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                ref.read(todoListProvider.notifier).deleteTodo(todo.id);
              },
            ),
          ),
        );
      },
    );
  }
}
