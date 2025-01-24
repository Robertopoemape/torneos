import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../src/models/models.dart';
import '../register_tournament.dart';

class RegisterTournamentVm extends ChangeNotifier {
  final RegisterTournamentController _controller;
  RegisterTournamentVm(this._controller);

  final List<MatchesData> matches = [];

  Future<void> registerTournament(BuildContext context) async {
    try {
      final tournamentId =
          FirebaseFirestore.instance.collection('tournaments').doc().id;

      final tournamentData = TournamentData(
        tournamentId: tournamentId,
        nameTournament: _controller.nameController.text,
        imageUrl: '',
        description: _controller.descriptionController.text,
        location: _controller.locationController.text,
        stadium: _controller.stadiumController.text,
        startDate: _controller.startDateController.text,
        endDate: _controller.endDateController.text,
        createDate: DateTime.now(),
        modifiedDate: DateTime.now(),
      );

      await FirebaseFirestore.instance
          .collection('tournaments')
          .doc(tournamentId)
          .set(tournamentData.toJson());

      for (var match in matches) {
        final matchData = MatchesData(
          tournamentId: tournamentId,
          dateStart: match.dateStart,
          hour: match.hour,
          teamLocal: match.teamLocal,
          teamVisitante: match.teamVisitante,
        );

        await FirebaseFirestore.instance
            .collection('matches')
            .add(matchData.toJson());
      }

      _controller.clearTournament();

      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Torneo y partidos registrados con éxito!')));
    } catch (e) {
      log("Error al registrar el torneo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar el torneo')));
    }
  }

  void addMatch() {
    final match = MatchesData(
      tournamentId: '',
      dateStart: _controller.matchDateController.text,
      hour: _controller.matchHourController.text,
      teamLocal: _controller.teamLocalController.text,
      teamVisitante: _controller.teamVisitanteController.text,
    );

    matches.add(match);

    _controller.clearFieldMatch();
    notifyListeners();
  }

  void removeMatchAt(int index) {
    if (index >= 0 && index < matches.length) {
      matches.removeAt(index);
      notifyListeners();
    }
  }
}
