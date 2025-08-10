import 'package:flutter/material.dart';

extension ColorX on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
