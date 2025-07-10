import 'package:flutter/material.dart';

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

  static String? validateDate(DateTime? value) {
    if (value == null) {
      return "Vui lòng chọn ngày";
    }
    if (value.isBefore(DateTime.now().subtract(Duration(days: 1)))) {
      return "Ngày không được trong quá khứ";
    }
    return null;
  }

  static String? validateTime(TimeOfDay? value) {
    if (value == null) {
      return "Vui lòng chọn thời gian";
    }
    return null;
  }

  static String? validateNotes(String? notes) {
    if (notes == null || notes.trim().isEmpty) {
      return "Vui lòng nhập notes todo";
    }
    if (notes.trim().length < 3) {
      return "Notes phải có ít nhất 3 ký tự";
    }
    if (notes.length > 500) {
      return "Notes không được quá 500 ký tự";
    }

    return null;
  }
}
