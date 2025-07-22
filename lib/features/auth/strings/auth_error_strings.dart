import 'package:easy_localization/easy_localization.dart';

class AuthErrorStrings {
  static String get emailAlreadyExists =>
      "errors.auth.email_already_exists".tr();

  static String get invalidEmailFormat =>
      "errors.auth.invalid_email_format".tr();

  static String get weakPassword => "errors.auth.weak_password".tr();
  static String get passwordConfirmation =>
      "errors.auth.password_confirmation".tr();
  static String get unknown => "errors.auth.unknown".tr();
  static String get emailRequired => "errors.auth.email_is_required".tr();
  static String get emailTooShort => "errors.auth.email_too_short".tr();
  static String get emailTooLong => "errors.auth.email_too_long".tr();

  static String get fullNameRequired => "errors.auth.full_name_required".tr();
  static String get fullNameTooShort => "errors.auth.full_name_too_short".tr();
  static String get fullNameTooLong => "errors.auth.full_name_too_long".tr();

  static String get passwordRequired => "errors.auth.password_is_required".tr();
  static String get passwordTooShort => "errors.auth.password_too_short".tr();
  static String get passwordTooLong => "errors.auth.password_too_long".tr();

  static String get confirmPasswordIsRequired =>
      "errors.auth.confirm_password_is_required".tr();
  static String get confirmPasswordDoesNotMatch =>
      "errors.auth.confirm_password_does_not_match".tr();

  static String mapServerErrorToLocalized(String error) {
    final normalized = error.toLowerCase();

    if (normalized.contains("email") && normalized.contains("taken")) {
      return "errors.auth.email_has_already_taken".tr();
    }

    return "errors.auth.unknown".tr();
  }
}
