import 'package:flutter/material.dart';

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

  TimeOfDay? toTimeOfDay() {
    if (isEmpty) return null;

    try {
      final parts = split(':');
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

extension ColorStringX on String {
  Color? toColor() {
    if (isEmpty) return null;

    try {
      String hexString = replaceAll('#', '');
      if (hexString.length == 6) {
        hexString = 'FF$hexString';
      }
      return Color(int.parse(hexString, radix: 16));
    } catch (e) {
      return null;
    }
  }
}

extension IconDataStringX on String {
  IconData? toIconData() {
    if (isEmpty) return null;

    final parts = split(':');
    if (parts.length != 2) return null;

    final fontFamily = parts[0];
    final codePoint = int.tryParse(parts[1]);

    if (codePoint == null) return null;

    return IconData(codePoint, fontFamily: fontFamily);
  }
}
