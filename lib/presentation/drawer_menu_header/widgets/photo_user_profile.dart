import 'package:flutter/material.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class PhotoUserProfile extends StatelessWidget {
  const PhotoUserProfile({
    required this.lblTitle,
    required this.playerPhotoUrl,
    super.key,
  });
  final String lblTitle;
  final String playerPhotoUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        gap10,
        Row(
          children: [
            space24,
            const Spacer(),
            Text(
              lblTitle,
              style: ComTextStyle.body1.w800.white,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            InkWell(
              onTap: () => autoRouterPop(context),
              child: Icon(
                Icons.close,
                color: ComColors.white,
                size: ds20,
              ),
            ),
          ],
        ),
        gap10,
        Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: ComColors.white300,
                radius: 115,
                child: CircleAvatar(
                  backgroundColor: ComColors.green500,
                  radius: 110,
                  child: ComImageSvg(
                    pathNetwork: playerPhotoUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
