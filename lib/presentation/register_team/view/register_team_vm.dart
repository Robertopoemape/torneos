import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../src/models/player_data.dart';
import '../controller/register_team_controller.dart';

class RegisterTeamVm with ChangeNotifier {
  final RegisterTeamController _controller;

  RegisterTeamVm(this._controller);

  String? selectedDocumentType;
  final List<PlayerData> players = [];

  bool validateForm() => _controller.formKey.currentState?.validate() ?? false;

  Future<void> addTeam() async {
    if (validateForm()) {
      final newPlayer = PlayerData(
        documentType: selectedDocumentType,
        documentNumber: _controller.numberDocumentController.text,
        name: _controller.nameController.text,
        lastName: _controller.lastNameController.text,
        shirtNumber: _controller.numberShirtController.text,
        createDate: DateTime.now(),
        modifiedDate: DateTime.now(),
      );

      try {
        await FirebaseFirestore.instance
            .collection('team')
            .add(newPlayer.toMap());
        players.add(newPlayer);
        clearPlayerFields();
        notifyListeners();
      } catch (e) {
        log("Error al guardar el jugador: $e");
      }
    }
  }

  void removePlayer(int index) {
    players.removeAt(index);
    notifyListeners();
  }

  void clearPlayerFields() {
    selectedDocumentType = null;
    _controller.clearFields();
    notifyListeners();
  }
}
