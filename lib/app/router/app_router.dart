import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/app/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/my_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/new_todo_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.root, builder: (context, state) => MyTodoPage()),
    GoRoute(
      path: AppRoutes.newTodo,
      builder: (context, state) => NewTodoPage(),
    ),
  ],
);
