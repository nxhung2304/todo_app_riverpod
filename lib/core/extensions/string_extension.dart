extension StringExtensions on String {
  bool isEmail() {
    final string = trim();

    if (string.isEmpty) {
      return false;
    }

    final emailRegex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegex);
    
    return regExp.hasMatch(string);
  }
}
