import 'package:flutter/material.dart';

class RegisterTournamentController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController stadiumController = TextEditingController();

  final TextEditingController matchDateController = TextEditingController();
  final TextEditingController matchHourController = TextEditingController();
  final TextEditingController teamLocalController = TextEditingController();
  final TextEditingController teamVisitanteController = TextEditingController();

  void clearTournament() {
    nameController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
    locationController.clear();
    stadiumController.clear();
  }

  void clearFieldMatch() {
    matchDateController.clear();
    matchHourController.clear();
    teamLocalController.clear();
    teamVisitanteController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    locationController.dispose();
    stadiumController.dispose();
    matchDateController.dispose();
    matchHourController.dispose();
    teamLocalController.dispose();
    teamVisitanteController.dispose();
    super.dispose();
  }
}
