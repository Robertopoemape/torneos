import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../src/models/player_data.dart';
import '../controller/register_team_controller.dart';

class RegisterTeamVm with ChangeNotifier {
  final RegisterTeamController _controller;
  RegisterTeamVm(this._controller);

  final ImagePicker picker = ImagePicker();
  final List<PlayerData> players = [];
  String? selectedDocumentType;
  String? selectedPositionPlayer;

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
        documentType: selectedDocumentType!,
        documentNumber: _controller.numberDocumentController.text,
        name: _controller.nameController.text,
        lastName: _controller.lastNameController.text,
        nickName: _controller.nickNameController.text,
        shirtNumber: _controller.numberShirtController.text,
        positionPlayer: _controller.positionPlayerController.text,
        imageUrl: _imgFileUpload?.path ?? '',
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

  Future<bool> requestCameraPermission() async {
    var statusCamera = await Permission.camera.request();
    if (statusCamera.isGranted) {
      log("Permiso concedido para la cámara");
      return true;
    } else {
      log("Permiso no concedido para la cámara");
      await openPermissionSettings();
      return false;
    }
  }

  Future<void> openGallery() async {
    if (await requestCameraPermission()) {
      final picker = ImagePicker();
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
    if (await requestCameraPermission()) {
      final picker = ImagePicker();
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
    _controller.clearFields();
    notifyListeners();
  }
}
