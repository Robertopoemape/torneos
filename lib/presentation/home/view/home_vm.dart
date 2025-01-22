import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../src/src.dart';

class HomeVm with ChangeNotifier {
  HomeVm() {
    initState();
  }
  initState() async {
    await loadTournamentData();
  }

  List<TournamentData> tournaments = [];
  Future<void> loadTournamentData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('tournaments').get();

      if (querySnapshot.docs.isNotEmpty) {
        tournaments = querySnapshot.docs.map((doc) {
          return TournamentData.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        notifyListeners();
      } else {
        log("No se encontraron torneos.");
      }
    } catch (e) {
      log("Error al cargar los torneos: $e");
    }
  }
}
