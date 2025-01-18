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

  final TextEditingController positionPlayerController =
      TextEditingController();
  final TextEditingController numberShirtController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();

  void clearFields() {
    teamNameController.clear();
    coachNameController.clear();
    typeDocumentController.clear();
    numberDocumentController.clear();
    nameController.clear();
    lastNameController.clear();
    positionPlayerController.clear();
    numberShirtController.clear();
    nickNameController.clear();
  }

  @override
  void dispose() {
    teamNameController.dispose();
    coachNameController.dispose();
    typeDocumentController.dispose();
    numberDocumentController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    positionPlayerController.dispose();
    numberShirtController.dispose();
    nickNameController.dispose();
    super.dispose();
  }
}
