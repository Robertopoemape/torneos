import 'package:flutter/material.dart';

import '../../../src/src.dart';

class HomeVm with ChangeNotifier {
  final List<TournamentData> tournaments = [
    TournamentData(
      tournamentId: '1',
      nameTournament: 'Torneo Nacional de Voleibol',
      imageUrl:
          'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
      description: 'El torneo más importante del país.',
      startDate: '2023-10-01',
      endDate: '2023-10-10',
      location: 'Ciudad Capital',
      stadium: 'Estadio Nacional',
      createDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    ),
    TournamentData(
      tournamentId: '2',
      nameTournament: 'Torneo Nacional ',
      imageUrl:
          'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
      description: 'El torneo más importante del país.',
      startDate: '2023-10-01',
      endDate: '2023-10-10',
      location: 'Lima',
      stadium: 'Estadio Nacional2',
      createDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    ),
  ];
}
