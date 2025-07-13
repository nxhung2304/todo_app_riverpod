import 'package:flutter/material.dart';

class TodoValidators {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Vui lòng nhập tiêu đề";
    }
    if (value.trim().length < 3) {
      return "Tiêu đề phải có ít nhất 3 ký tự";
    }
    if (value.length > 100) {
      return "Tiêu đề không được quá 100 ký tự";
    }

    return null;
  }

  static String? validateDate(DateTime? value) {
    // if (value == null) {
    //   return "Vui lòng chọn ngày";
    // }
    if (value == null) {
      return null;
    }

    if (value.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return "Ngày không được trong quá khứ";
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
        return "Vui lòng chọn thời gian khi đã chọn ngày";
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
          return "Thời gian không được trong quá khứ";
        }
      }

      return null;
    };
  }

  static String? validateNotes(String? notes) {
    if (notes == null) {
      return null;
    }

    if (notes.length > 500) {
      return "Notes không được quá 500 ký tự";
    }

    return null;
  }
}
