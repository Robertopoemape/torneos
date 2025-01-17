import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ItemExpansionTitle extends StatelessWidget {
  const ItemExpansionTitle({
    required this.name,
    this.onTap,
    super.key,
  });

  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
