import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/app_navigation.dart';

import 'package:learn_riverpod/features/todo/presentation/pages/home_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/my_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/new_todo_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/search_page.dart';
import 'package:learn_riverpod/features/todo/presentation/pages/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => HomePage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.todo,
              builder: (context, state) => MyTodoPage(),
              routes: [
                GoRoute(
                  path: 'new',
                  builder: (context, state) => NewTodoPage(),
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search,
              builder: (context, state) => SearchPage(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.settings,
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
