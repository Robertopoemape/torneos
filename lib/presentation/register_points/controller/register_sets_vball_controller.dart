import 'package:flutter/material.dart';

class VolleyballMatchesController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController localTeamController = TextEditingController();
  final TextEditingController visitantTeamController = TextEditingController();

  final List<TextEditingController> team1PointsControllers = [];
  final List<TextEditingController> team2PointsControllers = [];

  void clearFields() {
    localTeamController.clear();
    visitantTeamController.clear();
    team1PointsControllers.clear();
    team2PointsControllers.clear();
  }

  @override
  void dispose() {
    localTeamController.dispose();
    visitantTeamController.dispose();
    for (final controller in team1PointsControllers) {
      controller.dispose();
    }
    for (final controller in team2PointsControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
