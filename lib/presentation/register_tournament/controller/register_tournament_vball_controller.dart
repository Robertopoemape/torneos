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
  final TextEditingController matchMinutesController = TextEditingController();
  final TextEditingController matchMeridiemController = TextEditingController();

  final TextEditingController teamLocalController = TextEditingController();
  final TextEditingController teamVisitantController = TextEditingController();

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
    teamVisitantController.clear();
    matchMinutesController.clear();
    matchMeridiemController.clear();
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
    teamVisitantController.dispose();
    matchMinutesController.dispose();
    matchMeridiemController.dispose();
    super.dispose();
  }
}
