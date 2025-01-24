import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final IconData? icon;
  final VoidCallback onOptionSelected;

  MenuItems({
    required this.onOptionSelected,
    required this.title,
    this.icon,
  });
}
