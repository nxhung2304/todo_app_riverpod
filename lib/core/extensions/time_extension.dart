import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  String toTimeString() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
