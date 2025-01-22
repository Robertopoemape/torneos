import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../src/models/models.dart';

class TournamentDetailVm extends ChangeNotifier {
  final TournamentData tournamentData;

  TournamentDetailVm(this.tournamentData) {
    initState();
  }
  initState() async {
    await getTournamentById();
  }

  List<MatchesData> matchesData = [];

  Future<void> getTournamentById() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('matches')
          .where('tournamentId', isEqualTo: tournamentData.tournamentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        matchesData = querySnapshot.docs.map((doc) {
          return MatchesData.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        notifyListeners();
      } else {
        log("No se encontraron torneos con el ID: ${tournamentData.tournamentId}");
      }
    } catch (e) {
      log('Error al cargar el torneo: $e');
    }
  }
}
