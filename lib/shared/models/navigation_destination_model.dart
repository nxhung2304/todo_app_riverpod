import 'package:flutter/material.dart';

class NavigationDestinationModel {
  final IconData icon;
  final String label;
  final String route;
  
  const NavigationDestinationModel({
    required this.icon,
    required this.label,
    required this.route,
  });
}
