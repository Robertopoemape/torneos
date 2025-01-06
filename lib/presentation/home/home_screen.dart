import 'package:flutter/material.dart';

import 'package:proyecto_torneos/core/style/style.dart';
import 'package:proyecto_torneos/presentation/end_drawer_add/end_drawer_add.dart';
import 'package:proyecto_torneos/presentation/result_table/result_table_screen.dart';
import 'package:proyecto_torneos/presentation/score_register/score_register_screen.dart';
import 'package:proyecto_torneos/presentation/home/widgets/torenos.dart';

import '../../core/core.dart';
import '../../src/models/models.dart';
import '../drawer_header_options/drawer_header_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHeaderOptions(),
      appBar: AppBar(
        backgroundColor: ComColors.inf800,
        title: Center(
          child: Text(
            'Incio',
            style: ComTextStyle.h6.gsWhite,
          ),
        ),
        actions: [
          CustomPopupMenu(
            onOptionSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScoreRegisterScreen(
                      onAddData: (MatchData) {},
                    ),
                  ),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultTableScreen(
                      matchData: [
                        MatchData(
                          position: 1,
                          teamName: 'Equipo A',
                          stats: MatchStats(
                            played: 10,
                            won: 7,
                            lost: 3,
                            setsFor: 21,
                            setsAgainst: 15,
                            diffSets: 6,
                            ratioSets: 1.40,
                            totalPointsFor: 600,
                            totalPointsAgainst: 450,
                            diffPoints: 150,
                            ratioPoints: 1.33,
                            twoZero: 5,
                            twoOne: 2,
                            oneTwo: 1,
                            zeroTwo: 2,
                          ),
                        ),
                        MatchData(
                          position: 2,
                          teamName: 'Equipo B',
                          stats: MatchStats(
                            played: 10,
                            won: 7,
                            lost: 3,
                            setsFor: 21,
                            setsAgainst: 15,
                            diffSets: 6,
                            ratioSets: 1.40,
                            totalPointsFor: 600,
                            totalPointsAgainst: 450,
                            diffPoints: 150,
                            ratioPoints: 1.33,
                            twoZero: 5,
                            twoOne: 2,
                            oneTwo: 1,
                            zeroTwo: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          /* IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => ScoreRegisterScreen(
                      onAddData: (MatchData) {},
                    ),
                  ),
                );
              },
              icon: Icon(Icons.person_add_alt_1_sharp),
            ),*/
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Torneos', style: ComTextStyle.h6),
            gap16,
            Expanded(child: Torneos()),
          ],
        ),
      ),
    );
  }
}
