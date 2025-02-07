import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../src/models/models.dart';
import '../register_tournament.dart';
import 'maps_screen.dart';

class RegisterTournamentVm extends ChangeNotifier {
  RegisterTournamentVm(this._controller) {
    initState();
  }
  final RegisterTournamentController _controller;

  final List<MatchesData> matches = [];

  initState() {
    _checkLocationPermission();
  }

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
          teamVisitant: match.teamVisitant,
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
      teamVisitant: _controller.teamVisitantController.text,
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

  LatLng _currentPosition = const LatLng(-12.0323798, -77.0909804);

  // Función para verificar los permisos de ubicación
  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Si el servicio no está habilitado, puedes solicitar al usuario que lo habilite.
      log("El servicio de ubicación no está habilitado.");
      return;
    }

    // Verificar los permisos de ubicación
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Solicitar permiso si no ha sido otorgado
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Si el permiso es denegado, muestra un mensaje o toma otra acción
        log("Permiso de ubicación denegado");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Si el permiso está denegado de manera permanente
      log("Permiso de ubicación denegado permanentemente");
      return;
    }

    // En este punto, el permiso ha sido otorgado
    _initCurrentLocation();
  }

  Future<void> _initCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Actualiza la ubicación con la que se obtiene del dispositivo
      _currentPosition = LatLng(position.latitude, position.longitude);
    } catch (e) {
      log("Error al obtener ubicación actual: $e");
    }
    notifyListeners();
  }

  Future<void> openFullScreenMap(BuildContext context) async {
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MapsScreen(initialPosition: _currentPosition),
      ),
    );

    if (result != null) {
      _currentPosition = result;
      _getAddressFromLatLng(result); // Ahora se obtiene la dirección aquí
    }
    notifyListeners();
  }

// Método para obtener la dirección basado en LatLng
  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        _controller.locationController.text =
            "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      log("Error al obtener dirección: $e");

      _controller.locationController.text = "Dirección no disponible";
    }
    notifyListeners();
  }
}
