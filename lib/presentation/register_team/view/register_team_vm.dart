import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../src/models/player_data.dart';
import '../controller/register_team_controller.dart';

class RegisterTeamVm with ChangeNotifier {
  final RegisterTeamController _controller;
  RegisterTeamVm(this._controller);

  final ImagePicker picker = ImagePicker();
  final List<PlayerData> players = [];
  String? selectedDocumentType;

  File? _imgFileUpload;
  File? get imgFileUpload => _imgFileUpload;
  set imgFileUpload(File? value) {
    _imgFileUpload = value;
    notifyListeners();
  }

  bool validateForm() => _controller.formKey.currentState?.validate() ?? false;

  Future<void> addTeam() async {
    if (validateForm()) {
      final newPlayer = PlayerData(
        documentType: selectedDocumentType,
        documentNumber: _controller.numberDocumentController.text,
        name: _controller.nameController.text,
        lastName: _controller.lastNameController.text,
        shirtNumber: _controller.numberShirtController.text,
        positionPlayer: _controller.positionPlayerController.text,
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

  Future<void> openGallery() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

    imgFileUpload = File(imageFile!.path);

    /*await Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CameraUpload(
          viewModel: viewModel,
        ),
      ),
    );*/
  }

  Future<void> openCamera() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      imgFileUpload = File(imageFile.path);

      /* await Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => CameraUpload(
            viewModel: viewModel,
          ),
        ),
      );*/
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
