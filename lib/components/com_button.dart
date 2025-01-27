import 'package:flutter/material.dart';

import '../core/core.dart';

class ComButton extends StatelessWidget {
  const ComButton({
    required this.onPressed,
    this.text = '',
    this.alignment = Alignment.centerLeft,
    this.backgroundColor = ComColors.succ500,
    this.labelColor = ComColors.gsWhite,
    this.borderColor = ComColors.succ500,
    this.padding,
    this.height,
    this.width,
    this.isActivatedIcon = false,
    this.icon = Icons.add,
    this.size = ds24,
    this.borderRadius = ds8,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color borderColor;
  final double? height;
  final double? width;
  final bool isActivatedIcon;
  final IconData icon;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: ds6,
          padding: padding,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor,
              width: ds1,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActivatedIcon) ...[
              Icon(
                icon,
                color: labelColor,
                size: size,
              ),
            ] else ...[
              space8,
              Text(
                text,
                style: ComTextStyle.button1.copyWith(color: labelColor),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
