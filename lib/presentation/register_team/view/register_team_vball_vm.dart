import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/methods/methods.dart';
import '../../../src/models/player_data.dart';
import '../controller/register_team_vball_controller.dart';

class RegisterTeamVm with ChangeNotifier {
  final RegisterTeamController _controller;
  RegisterTeamVm(this._controller);

  final ImagePicker picker = ImagePicker();
  final List<PlayerData> players = [];
  String? selectedDocumentType = '';
  String? selectedPositionPlayer;

  File? _imgFileUpload;
  File? get imgFileUpload => _imgFileUpload;
  set imgFileUpload(File? value) {
    _imgFileUpload = value;
    notifyListeners();
  }

  bool validateForm() => _controller.formKey.currentState?.validate() ?? false;
  Future<void> addTeam() async {
    try {
      DocumentReference teamRef =
          await FirebaseFirestore.instance.collection('teams').add({
        'name': _controller.nameController.text,
        'coach': _controller.coachNameController.text,
        'createDate': DateTime.now(),
        'modifiedDate': DateTime.now(),
      });

      String teamId = teamRef.id;

      final newPlayer = PlayerData(
        teamId: teamId,
        documentType: _controller.typeDocumentController.text,
        documentNumber: _controller.numberDocumentController.text,
        name: _controller.nameController.text,
        lastName: _controller.lastNameController.text,
        nickName: _controller.nickNameController.text,
        shirtNumber: _controller.numberShirtController.text,
        positionPlayer: _controller.positionPlayerController.text,
        imageUrl: imgFileUpload?.path ?? '',
        createDate: DateTime.now(),
        modifiedDate: DateTime.now(),
      );

      saveImageLocally();

      await FirebaseFirestore.instance
          .collection('players')
          .add(newPlayer.toMap());

      await teamRef.update({
        'players': FieldValue.arrayUnion([newPlayer.toMap()]),
      });

      clearPlayerFields();
      notifyListeners();
    } catch (e) {
      log("Error al guardar el jugador con la URL de la imagen: $e");
    }
  }

  Future<void> saveImageLocally() async {
    if (_imgFileUpload == null) return;

    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}.png'; // Nombre único basado en timestamp
      String filePath = '$appDocPath/$fileName';

      File localFile = await _imgFileUpload!.copy(filePath);

      log("Imagen guardada localmente en: ${localFile.path}");
    } catch (e) {
      log("Error al guardar la imagen localmente: $e");
    }
  }

  Future<void> openGallery() async {
    if (await PermissionHandler.camera()) {
      XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        imgFileUpload = File(imageFile.path);
        log("Imagen seleccionada: ${imageFile.path}");
      } else {
        log("No se seleccionó imagen");
      }
    }
  }

  Future<void> openCamera() async {
    if (await PermissionHandler.camera()) {
      XFile? imageFile = await picker.pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        imgFileUpload = File(imageFile.path);
        log("Imagen capturada: ${imageFile.path}");
      } else {
        log("No se capturó imagen");
      }
    }
  }

  Future<void> openPermissionSettings() async {
    await openAppSettings();
  }

  void removePlayer(int index) {
    players.removeAt(index);
    notifyListeners();
  }

  void clearPlayerFields() {
    selectedDocumentType = null;
    selectedPositionPlayer = null;
    _controller.clearFields();
    notifyListeners();
  }
}
