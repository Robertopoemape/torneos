import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CustomPopupMenu extends StatelessWidget {
  final void Function(int) onOptionSelected;

  const CustomPopupMenu({super.key, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: onOptionSelected,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: const [
              Icon(Icons.add, color: Colors.black),
              SizedBox(width: 8),
              Text('Registro de puntaje'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: const [
              Icon(Icons.bar_chart, color: Colors.black),
              SizedBox(width: 8),
              Text('Tabla de puntaje'),
            ],
          ),
        ),
      ],
    );
  }
}
