import 'package:flutter/material.dart';

import '../core/core.dart';

class ComButton extends StatelessWidget {
  const ComButton({
    required this.onPressed,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.backgroundColor = ComColors.succ500,
    this.labelColor = ComColors.gsWhite,
    this.borderColor = ComColors.succ500,
    this.padding,
    this.height,
    this.width,
    this.isActivatedIcon = false,
    this.icon = Icons.add,
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
            borderRadius: BorderRadius.circular(ds8),
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
              ),
              space8,
            ],
            Text(
              text,
              style: ComTextStyle.button1.copyWith(color: labelColor),
            ),
          ],
        ),
      ),
    );
  }
}
