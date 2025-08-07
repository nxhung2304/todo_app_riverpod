import 'package:easy_localization/easy_localization.dart';

class TodoErrorStrings {
  static String get idNotFound => "errors.todo.id_not_found".tr();
  static String get invalidId => "errors.todo.invalid_id".tr();
  static String get notFound => "errors.todo.not_found".tr();
  static String get loadFailed => "errors.todo.load_failed".tr();

  static String get titleRequired => "errors.todo.title_required".tr();
  static String get titleMinLength => "errors.todo.title_min_length".tr();
  static String get titleMaxLength => "errors.todo.title_max_length".tr();

  static String get dateInPast => "errors.todo.date_in_past".tr();
  static String get timeInPast => "errors.todo.time_in_past".tr();

  static String get selectDateWhenTimeSelected =>
      "errors.todo.select_date_when_time_selected".tr();

  static String get descriptionMaxLength =>
      "errors.todo.description_max_length".tr();
}
