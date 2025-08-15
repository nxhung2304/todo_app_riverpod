class ApiEndpoints {
  // Auth
  static const String signup = '/auth';
  static const String login = '/auth/sign_in';
  static const String logout = '/auth/sign_out';
  static const String validateToken = '/auth/validate_token';
  static const String resetPassword = '/auth/password';
  static const String googleLogin = '/auth/google_login';

  // Todo
  static const String todos = '/todos';

  static String updateTodo(int todoId) => '$todos/$todoId';
  static String toggleTodo(int todoId) => '$todos/$todoId/toggle';
  static String deleteTodo(int todoId) => '$todos/$todoId';

  // Category
  static const String categories = '/categories';
  static String getCategoryById(int categoryId) => '$categories/$categoryId';
  static String updateCategory(int categoryId) => '$categories/$categoryId';
  static String deleteCategory(int categoryId) => '$categories/$categoryId';
}
