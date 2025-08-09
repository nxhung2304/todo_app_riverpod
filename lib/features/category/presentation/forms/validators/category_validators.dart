class CategoryValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }

    return null;
  }

  static String? validateColor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Color cannot be empty';
    }

    return null;
  }

  static String? validateIcon(String? value) {
    if (value == null || value.isEmpty) {
      return 'Icon cannot be empty';
    }

    return null;
  }
}
