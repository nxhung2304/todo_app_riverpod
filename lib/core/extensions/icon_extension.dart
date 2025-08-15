import 'package:flutter/material.dart';

extension IconDataX on IconData {
  String toStorageString() {
    return '${fontFamily ?? 'MaterialIcons'}:0x${codePoint.toRadixString(16)}';
  }
}
