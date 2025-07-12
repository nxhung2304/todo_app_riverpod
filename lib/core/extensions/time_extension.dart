import 'package:flutter/material.dart';

extension TimeOfDayExtensions on TimeOfDay {
  String toTimeString() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

extension StringTimeExtensions on String? {
  TimeOfDay? toTimeOfDay() {
    if (this == null || this!.isEmpty) return null;

    try {
      final parts = this!.split(':');
      if (parts.length != 2) return null;

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return null;
    }
  }
}
