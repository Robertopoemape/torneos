import 'package:flutter/material.dart';

import '../../../core/style/style.dart';

class ItemsExpansionTitle extends StatelessWidget {
  const ItemsExpansionTitle({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción para una sub-opción
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: ComColors.act300.withOpacity(0.2),
      highlightColor: ComColors.gs200.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: ComTextStyle.body2.gsWhite,
        ),
      ),
    );
  }
}
