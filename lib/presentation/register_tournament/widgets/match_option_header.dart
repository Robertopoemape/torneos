import 'package:flutter/material.dart';

import '../../../core/core.dart';

class MatchOptionHeader extends StatelessWidget {
  const MatchOptionHeader({
    required this.dateStart,
    required this.hour,
    required this.onTap,
    super.key,
  });

  final String dateStart;
  final String hour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        space8,
        SizedBox(
          width: ds90,
          child: Text(
            '$dateStart | $hour',
            style: ComTextStyle.tinyCaption.w900,
          ),
        ),
        Spacer(),
        Icon(
          Icons.sync,
          size: ds20,
        ),
        Spacer(),
        Container(
          alignment: Alignment.centerRight,
          width: ds90,
          child: InkWell(
            onTap: onTap,
            child: Icon(
              Icons.close_rounded,
              size: ds20,
            ),
          ),
        ),
        space8,
      ],
    );
  }
}
