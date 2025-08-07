import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String toApiString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String toFormattedString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  bool isValid() {
    return hour >= 0 && hour <= 23 && minute >= 0 && minute <= 59;
  }
}
