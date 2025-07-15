class AppRoutes {
  static String home = '/home';

  static String todo = '/todo';
  static String newTodo = '/todo/new';
  static String editTodo = '/todo/edit/:todoId';

  static String search = '/search';
  static String settings = '/settings';

  // Auth
  static String login = '/login';

  // Helper
  static String editTodoPath(int todoId) => '/todo/edit/$todoId';
}
