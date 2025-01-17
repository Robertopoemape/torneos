import 'package:flutter/material.dart';

class RegisterTeamController with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController coachNameController = TextEditingController();
  final TextEditingController typeDocumentController = TextEditingController();
  final TextEditingController numberDocumentController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController numberShirtController = TextEditingController();

  void clearFields() {
    teamNameController.clear();
    coachNameController.clear();
    typeDocumentController.clear();
    numberDocumentController.clear();
    nameController.clear();
    lastNameController.clear();
    numberShirtController.clear();
  }

  @override
  void dispose() {
    teamNameController.dispose();
    coachNameController.dispose();
    typeDocumentController.dispose();
    numberDocumentController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    numberShirtController.dispose();
    super.dispose();
  }
}
