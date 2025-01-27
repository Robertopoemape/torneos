import 'package:flutter/material.dart';

import '../core/core.dart';

class ComDivider extends StatelessWidget {
  const ComDivider({
    this.indent = ds40,
    this.endIndent = ds40,
    this.thickness = ds1,
    this.color = ComColors.green500,
    super.key,
  });

  final double indent;
  final double endIndent;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      endIndent: endIndent,
      thickness: thickness,
      color: color,
    );
  }
}
