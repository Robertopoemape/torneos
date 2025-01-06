import 'package:flutter/material.dart';

class ScoreRegisterController with ChangeNotifier {
  static final Map<String, TextEditingController> controllers = {
    'teamName': TextEditingController(),
    'played': TextEditingController(),
    'won': TextEditingController(),
    'lost': TextEditingController(),
    'setsFor': TextEditingController(),
    'setsAgainst': TextEditingController(),
    'diffSets': TextEditingController(),
    'ratioSets': TextEditingController(),
    'pointsFor': TextEditingController(),
    'pointsAgainst': TextEditingController(),
    'diffPoints': TextEditingController(),
    'ratioPoints': TextEditingController(),
    'twoZero': TextEditingController(),
    'twoOne': TextEditingController(),
    'oneTwo': TextEditingController(),
    'zeroTwo': TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
