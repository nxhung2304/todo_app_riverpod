import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/features/auth/strings/auth_error_strings.dart';

class AuthValidators {
  static int minLength = 3;
  static int maxLength = 100;

  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return AuthErrorStrings.fullNameRequired;
    }
    if (fullName.trim().length < minLength) {
      return AuthErrorStrings.fullNameTooShort;
    }
    if (fullName.length > maxLength) {
      return AuthErrorStrings.fullNameTooLong;
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return AuthErrorStrings.emailRequired;
    }
    if (email.trim().length < minLength) {
      return AuthErrorStrings.emailTooShort;
    }
    if (email.length > maxLength) {
      return AuthErrorStrings.emailTooLong;
    }

    if (!email.isEmail()) {
      return AuthErrorStrings.invalidEmailFormat;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return AuthErrorStrings.passwordRequired;
    }
    if (password.trim().length < minLength) {
      return AuthErrorStrings.passwordTooShort;
    }
    if (password.length > maxLength) {
      return AuthErrorStrings.passwordTooLong;
    }

    return null;
  }

   static String? validateConfirmPassword(String password, String? confirmPassword) {
   
   if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return AuthErrorStrings.confirmPasswordIsRequired;
    }
    
    if (confirmPassword.trim() != password.trim()) {
      return AuthErrorStrings.confirmPasswordDoesNotMatch;
    }

    validatePassword(confirmPassword);

    return null;
  }
}
