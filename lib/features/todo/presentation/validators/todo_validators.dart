import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/strings/todo_error_strings.dart';

class TodoValidators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TodoErrorStrings.titleRequired;
    }
    if (value.trim().length < 3) {
      return TodoErrorStrings.titleMinLength;
    }
    if (value.length > 100) {
      return TodoErrorStrings.titleMaxLength;
    }

    return null;
  }

  static String? validateDate(DateTime? value) {
    if (value == null) {
      return null;
    }

    if (value.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return TodoErrorStrings.dateInPast;
    }

    return null;
  }

  static String? validateTime(TimeOfDay? value) {
    return null;
  }

  static String? Function(TimeOfDay?) validateTimeWithDate(
    DateTime? selectedDate,
  ) {
    return (TimeOfDay? value) {
      if (selectedDate != null && value == null) {
        return TodoErrorStrings.selectDateWhenTimeSelected;
      }

      if (selectedDate != null && value != null) {
        final now = DateTime.now();
        final selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          value.hour,
          value.minute,
        );

        if (selectedDateTime.isBefore(now)) {
          return TodoErrorStrings.timeInPast;
        }
      }

      return null;
    };
  }

  static String? validateNotes(String? description) {
    if (description == null) {
      return null;
    }

    if (description.length > 500) {
      return TodoErrorStrings.descriptionMaxLength;
    }

    return null;
  }
}
