import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/style/style.dart';

import '../../../core/core.dart';

class PhotoUserProfile extends StatelessWidget {
  const PhotoUserProfile({
    required this.lblTitle,
    required this.lblCode,
    required this.code,
    required this.onPressedOpenDrawer,
    super.key,
  });
  final String lblTitle;
  final String lblCode;
  final String code;
  final VoidCallback onPressedOpenDrawer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        gap10,
        Row(
          children: [
            SizedBox(width: 24),
            const Spacer(),
            Text(
              lblTitle,
              style: ComTextStyle.body1.w800.gsWhite,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            const Center(
              child: CircleAvatar(
                backgroundColor: ComColors.succ500,
                radius: 120,
                child: CircleAvatar(
                  backgroundColor: ComColors.gs200,
                  radius: 110,
                  child: Icon(
                    Icons.person,
                    size: 200,
                    color: ComColors.inf500,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Text(
                '$lblCode  $code',
                style: ComTextStyle.subtitle2.w400.gsWhite,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
