import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'widgets.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({
    required this.teamLocal,
    required this.teamVisitant,
    super.key,
  });
  final String teamLocal;
  final String teamVisitant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          elevation: ds4,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              space4,
              SizedBox(
                width: ds120,
                child: Text(
                  textAlign: TextAlign.center,
                  teamLocal,
                  style: ComTextStyle.body1.w900,
                ),
              ),
              TrapezoidWithVS(
                label: 'VS',
              ),
              SizedBox(
                width: ds120,
                child: Text(
                  teamVisitant,
                  textAlign: TextAlign.center,
                  style: ComTextStyle.body1.w900,
                ),
              ),
            ],
          )),
    );
  }
}
