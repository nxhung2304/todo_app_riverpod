import 'package:flutter/material.dart';

extension IconDataX on IconData {
  String toStorageString() {
    return '${fontFamily ?? 'MaterialIcons'}:$codePoint';
  }
}
