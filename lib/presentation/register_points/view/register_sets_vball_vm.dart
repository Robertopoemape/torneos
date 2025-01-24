import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../src/models/models.dart';
import '../controller/register_sets_vball_controller.dart';

class RegisterVoleySetsVm with ChangeNotifier {
  RegisterVoleySetsVm(
    this._controller,
    this.tournamentId,
    this.localTeam,
    this.visitantTeam,
  ) {
    initState();
  }
  final VolleyballMatchesController _controller;
  final String tournamentId;
  final String localTeam;
  final String visitantTeam;

  final List<SetScore> sets = [];

  final int maxSets = 5;
  String? _matchId;

  int _currentSets = 1;
  int get currentSets => _currentSets;
  set currentSets(int value) {
    _currentSets = value;
    notifyListeners();
  }

  void initState() {
    _controller.localTeamController.text = localTeam;
    _controller.visitantTeamController.text = visitantTeam;
  }

  void incrementSet(int currentSet) {
    currentSet++;
  }

  Future<void> saveMatch(BuildContext context) async {
    if (sets.isEmpty) return;

    int resultLocal = 0;
    int resultVisitant = 0;
    int scoreLocal = 0;
    int scoreVisitant = 0;
    int pointLocal = 0;
    int pointVisitant = 0;
    int score = 0;

    for (var set in sets) {
      pointLocal += set.localteam;
      pointVisitant += set.visitantTeam;
      if (set.localteam > set.visitantTeam) {
        resultLocal++;
      } else {
        resultVisitant++;
      }

      if (resultLocal > resultVisitant) {
        score = _calculateScore(resultLocal, resultVisitant);
        scoreLocal = score;
      } else {
        score = _calculateScore(resultVisitant, resultLocal);
        scoreVisitant = score;
      }
    }

    final localTeamDetails = TeamDetails(
      s1: sets.isNotEmpty ? sets[0].localteam : 0,
      s2: sets.length > 1 ? sets[1].localteam : 0,
      s3: sets.length > 2 ? sets[2].localteam : 0,
      s4: sets.length > 3 ? sets[3].localteam : 0,
      s5: sets.length > 4 ? sets[4].localteam : 0,
      result: resultLocal,
      score: scoreLocal,
      point: pointLocal,
    );

    final visitantTeamDetails = TeamDetails(
      s1: sets.isNotEmpty ? sets[0].visitantTeam : 0,
      s2: sets.length > 1 ? sets[1].visitantTeam : 0,
      s3: sets.length > 2 ? sets[2].visitantTeam : 0,
      s4: sets.length > 3 ? sets[3].visitantTeam : 0,
      s5: sets.length > 4 ? sets[4].visitantTeam : 0,
      result: resultVisitant,
      score: scoreVisitant,
      point: pointVisitant,
    );

    final match = VolleyballMatch(
      tournamentId: tournamentId,
      nameLocal: _controller.localTeamController.text,
      nameVisitant: _controller.visitantTeamController.text,
      sets: sets,
      localTeamDetails: localTeamDetails,
      visitantTeamDetails: visitantTeamDetails,
      createDate: DateTime.now(),
      modifiedDate: DateTime.now(),
    );

    try {
      if (_matchId == null) {
        final docRef = await FirebaseFirestore.instance
            .collection('volleyball_sets')
            .add(match.toJson());
        _matchId = docRef.id;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Partido creado con éxito!')),
        );
      } else {
        await FirebaseFirestore.instance
            .collection('volleyball_sets')
            .doc(_matchId)
            .update(match.toJson());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Partido actualizado con éxito!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving data: $e')),
      );
    }
  }

  int _calculateScore(int teamWin, int teamLoser) {
    const scoreMap = {
      '2-0': 3,
      '2-1': 2,
      '1-2': 1,
      '0-2': 0,
    };

    final key = '$teamWin-$teamLoser';

    return scoreMap[key] ?? 0;
  }

  void addControllersForSet(int index) {
    if (_controller.team1PointsControllers.length <= index) {
      _controller.team1PointsControllers.add(TextEditingController());
      _controller.team2PointsControllers.add(TextEditingController());
    }
    if (sets.length > index) {
      _controller.team1PointsControllers[index].text =
          sets[index].localteam.toString();
      _controller.team2PointsControllers[index].text =
          sets[index].visitantTeam.toString();
    }
  }
}
