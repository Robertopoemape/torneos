import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TrapezoidWithVS extends StatelessWidget {
  const TrapezoidWithVS({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(ds60, ds60),
          painter: _TrapezoidPainter(),
        ),
        Positioned(
          child: Text(
            label,
            style: ComTextStyle.h6.white,
          ),
        ),
      ],
    );
  }
}

class _TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ComColors.black600
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
