class AuthValidators {
  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "Vui lòng nhập Full name";
    }
    if (fullName.trim().length < 3) {
      return "Full name phải có ít nhất 3 ký tự";
    }
    if (fullName.length > 100) {
      return "Full name không được quá 100 ký tự";
    }

    return null;
  }

  static String? validateEmail(String? email) {
    final emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (email == null || email.trim().isEmpty) {
      return "Vui lòng nhập Email";
    }
    if (email.trim().length < 3) {
      return "Email phải có ít nhất 3 ký tự";
    }
    if (email.length > 100) {
      return "Email không được quá 100 ký tự";
    }
    RegExp regExp = RegExp(emailRegex);
    final validEmailFormat = regExp.hasMatch(email);

    if (!validEmailFormat) {
      return "Email khong dung dinh dang";
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "Vui lòng nhập password";
    }
    if (password.trim().length < 6) {
      return "Password phải có ít nhất 6 ký tự";
    }
    if (password.length > 100) {
      return "Password không được quá 100 ký tự";
    }

    return null;
  }
}
