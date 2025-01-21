import 'package:flutter/material.dart';

import '../../../src/models/models.dart';

class TournamentDetailVm extends ChangeNotifier {
  late TournamentDetailData _tournament;

  TournamentDetailVm(String tournamentId) {
    _tournament = getTournamentById(tournamentId);
  }

  final List<TournamentDetailData> _tournaments = [
    TournamentDetailData(
      tournamentId: '1',
      nameTournament: 'Torneo Nacional de Voleibol',
      imageUrl:
          'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
      description: 'El torneo más importante del país.',
      startDate: '2023-10-01',
      endDate: '2023-10-10',
      location: 'Ciudad Capital',
      stadium: 'Estadio Nacional',
      matches: [
        MatchesData(
          matchesId: 'match1',
          tournamentId: '1',
          date: '2023-10-02',
          hour: '10:00 AM',
          teamLocal: 'Equipo A',
          teamVisitante: 'Equipo B',
        ),
        MatchesData(
          matchesId: 'match2',
          tournamentId: '1',
          date: '2023-10-02',
          hour: '12:00 PM',
          teamLocal: 'Equipo C',
          teamVisitante: 'Equipo D',
        ),
        MatchesData(
          matchesId: 'match3',
          tournamentId: '1',
          date: '2023-10-03',
          hour: '10:00 AM',
          teamLocal: 'Equipo E',
          teamVisitante: 'Equipo F',
        ),
      ],
      createDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    ),
    TournamentDetailData(
      tournamentId: '2',
      nameTournament: 'Torneo Nacional',
      imageUrl:
          'https://st4.depositphotos.com/20523700/25950/i/450/depositphotos_259506188-stock-photo-illustration-picture-icon.jpg',
      description: 'El torneo más importante del país.',
      startDate: '2023-10-01',
      endDate: '2023-10-10',
      location: 'Lima',
      stadium: 'Estadio Nacional2',
      matches: [
        MatchesData(
          matchesId: 'match1',
          tournamentId: '1',
          date: '2023-10-02',
          hour: '10:00 AM',
          teamLocal: 'Equipo A',
          teamVisitante: 'Equipo B',
        ),
        MatchesData(
          matchesId: 'match2',
          tournamentId: '1',
          date: '2023-10-02',
          hour: '12:00 PM',
          teamLocal: 'Equipo C',
          teamVisitante: 'Equipo D',
        ),
        MatchesData(
          matchesId: 'match3',
          tournamentId: '1',
          date: '2023-10-03',
          hour: '10:00 AM',
          teamLocal: 'Equipo E',
          teamVisitante: 'Equipo F',
        ),
      ],
      createDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    ),
  ];
  List<TournamentDetailData> get tournaments => _tournaments;

  TournamentDetailData get tournament => _tournament;

  TournamentDetailData getTournamentById(String id) {
    return _tournaments.firstWhere(
      (t) => t.tournamentId == id,
      orElse: () => throw Exception('Tournament not found'),
    );
  }
}
