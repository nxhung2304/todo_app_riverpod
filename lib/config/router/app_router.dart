import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/home_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/my_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/new_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/search_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/todo',
      builder: (context, state) => MyTodoPage(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => NewTodoPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
