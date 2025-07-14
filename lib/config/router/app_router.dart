import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/edit_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/home_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/new_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/search_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/settings_page.dart';
import 'package:learn_riverpod/features/todo/strings/todo_error_strings.dart';
import 'package:learn_riverpod/shared/widgets/layout/error_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  errorBuilder:
      (context, state) => ErrorPage(
        message: 'Không tìm thấy trang',
        error: state.error.toString(),
      ),
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => HomePage()),
    GoRoute(
      path: AppRoutes.todo,
      builder: (context, state) => TodoPage(),
      routes: [
        GoRoute(path: 'new', builder: (context, state) => NewTodoPage()),
        GoRoute(
          path: 'edit/:todoId',
          builder: (context, state) {
            final todoIdString = state.pathParameters['todoIdd'];
              return ErrorPage(message: TodoErrorStrings.idNotFound);
            // if (todoIdString == null) {
            //   return ErrorPage(message: TodoErrorStrings.idNotFound);
            // }
            //
            // final todoId = int.parse(todoIdString);
            //
            // if (todoId == null) {
            //   return ErrorPage(message: TodoErrorStrings.invalidId);
            // }
            //
            // return EditTodoPage(todoId: todoId);
          },
        ),
      ],
    ),
    GoRoute(path: AppRoutes.search, builder: (context, state) => SearchPage()),
    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
