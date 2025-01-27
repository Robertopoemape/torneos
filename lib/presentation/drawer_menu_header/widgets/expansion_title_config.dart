import 'package:flutter/material.dart';
import '../../../core/core.dart';
import 'item_expansion_title.dart';

class ExpansionTitleConfig extends StatelessWidget {
  const ExpansionTitleConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Padding(
          padding: EdgeInsets.zero,
          child: Text(
            'Configuración',
            style: ComTextStyle.body1.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconColor: ComColors.white,
        textColor: ComColors.white,
        collapsedIconColor: ComColors.white500,
        collapsedTextColor: ComColors.white500,
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ItemExpansionTitle(
            name: 'Registro de torneos',
            onTap: () {
              autoRouterPush(context, RegisterTournamentRoute());
            },
          ),
          ItemExpansionTitle(
            name: 'Registro de equipos',
            onTap: () {
              autoRouterPush(context, RegisterTeamVballRoute());
            },
          ),
          ItemExpansionTitle(name: 'Fixture'),
          ItemExpansionTitle(name: 'Reportes'),
        ],
      ),
    );
  }
}
