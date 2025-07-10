class TodoValidators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Vui lòng nhập tiêu đề todo";
    }
    if (value.trim().length < 3) {
      return "Tiêu đề phải có ít nhất 3 ký tự";
    }
    if (value.length > 100) {
      return "Tiêu đề không được quá 100 ký tự";
    }

    return null;
  }
}
