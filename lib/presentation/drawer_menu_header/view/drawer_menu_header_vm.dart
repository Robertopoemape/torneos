import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DrawerMenuHeaderVm with ChangeNotifier {
  DrawerMenuHeaderVm() {
    initState();
  }

  initState() async {
    await fetchPlayerData('1');
    await loadPlayerData();
  }

  String playerName = '';
  String? playerPhotoUrl = '';

  Future<void> loadPlayerData() async {
    try {
      if (playerPhotoUrl != null && playerPhotoUrl!.isNotEmpty) {
        File imageFile = File(playerPhotoUrl!);

        if (await imageFile.exists()) {
          log("Imagen cargada desde almacenamiento local: ${imageFile.path}");
        } else {
          log("No se encontró la imagen en el almacenamiento local");
          playerPhotoUrl = null;
        }
      } else {
        log("No se tiene una ruta válida para la imagen");
      }

      notifyListeners();
    } catch (e) {
      log("Error al cargar los datos del jugador: $e");
    }
  }

  Future<void> fetchPlayerData(String documentId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('team')
          .where('teamId', isEqualTo: documentId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data();
        playerName = data['name'] ?? 'Sin Nombre';
        playerPhotoUrl = data['imageUrl'] ?? '';

        log("Player photo URL: $playerPhotoUrl");

        notifyListeners();
      } else {
        debugPrint("El documento con ID $documentId no existe.");
      }
    } on FirebaseException catch (e) {
      debugPrint("Error específico de Firestore: ${e.message}");
    } catch (e) {
      debugPrint("Error inesperado: $e");
    }
  }
}
