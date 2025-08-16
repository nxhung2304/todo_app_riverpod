import 'package:easy_localization/easy_localization.dart';

class CategoryStrings {
  static const String _prefix = 'category';

  // Fields
  static String get title => "$_prefix.title".tr();
  static String get name => "$_prefix.name".tr();
  static String get color => "$_prefix.color".tr();
  static String get icon => "$_prefix.icon".tr();

  // Actions
  static String get editButton => "$_prefix.edit".tr();
  static String get newButton => "$_prefix.new".tr();
  static String get deleteButton => "$_prefix.delete".tr();

  // Titles
  static String get editTitle => "$_prefix.edit_title".tr();
  static String get createTitle => "$_prefix.create_title".tr();

  // Messages
  static String get createdSuccess => "$_prefix.created_success".tr();
  static String get failedCreate => "$_prefix.failed_create".tr();
  static String get updateSuccess => "$_prefix.updated_success".tr();
  static String get updateError => "$_prefix.failed_update".tr();
  static String get deleteSuccess => "$_prefix.deleted_success".tr();
  static String get deleteError => "$_prefix.failed_delete".tr();
  static String get categoryNotFound => "$_prefix.not_found".tr();
  static String get noCategoriesFound => "$_prefix.no_categories_found".tr();

  // Validation errors
  static String get nameRequired => "errors.$_prefix.name_required".tr();
  static String get nameMinLength => "errors.$_prefix.name_min_length".tr();
}
