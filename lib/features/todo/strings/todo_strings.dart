import 'package:easy_localization/easy_localization.dart';

class TodoStrings {
  static String get title => "todo.title".tr();
  static String get newTodo => "todo.new_todo".tr();
  static String get noTodosYet => "todo.no_todos_yet".tr();
  static String get needNewTodo => "todo.need_new_todo".tr();

  // Fields
  static String get name => "todo.name".tr();
  static String get date => "todo.date".tr();
  static String get time => "todo.time".tr();
  static String get description => "todo.description".tr();

  // Errors
  static String get idNotFound => "todo.error.id_not_found".tr();
  static String get invalidId => "todo.error.invalid_id".tr();

  // Actions
  static String get newButton => "todo.new_button".tr();
  static String get editButton => "todo.edit_button".tr();

  // Messages
  static String get createSuccess => "todo.create_success";
  static String get updateSuccess => "todo.update_success";
  static String get updateError => "todo.update_error";
  static String get deleteSuccess => "todo.delete_success";
  static String get notFound => "todo.not_found".tr();
}
