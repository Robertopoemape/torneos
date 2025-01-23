import 'package:flutter/material.dart';

import '../../../src/models/models.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    required this.options,
    super.key,
  });
  final List<MenuItems> options;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (index) => options[index].onOptionSelected(),
      itemBuilder: (context) => options.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return PopupMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Icon(item.icon, color: Colors.black),
              const SizedBox(width: 8),
              Text(item.title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
