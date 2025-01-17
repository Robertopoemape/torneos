import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

@RoutePage()
class VolleyballMatchesScreen extends StatefulWidget {
  const VolleyballMatchesScreen({super.key});

  @override
  VolleyballMatchesScreenState createState() => VolleyballMatchesScreenState();
}

class VolleyballMatchesScreenState extends State<VolleyballMatchesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final List<Map<String, int>> _sets = [];
  final List<TextEditingController> _team1PointsControllers = [];
  final List<TextEditingController> _team2PointsControllers = [];
  int _currentSet = 1;
  final int _maxSets = 5;
  String? _matchId;

  Future<void> _saveMatch() async {
    if (_sets.isEmpty) return;

    int team1Wins = 0;
    int team2Wins = 0;
    int team1PointsTotal = 0;
    int team2PointsTotal = 0;

    for (var set in _sets) {
      team1PointsTotal += set["team1"]!;
      team2PointsTotal += set["team2"]!;
      if (set["team1"]! > set["team2"]!) {
        team1Wins++;
      } else {
        team2Wins++;
      }
    }

    final matchData = {
      "date": DateTime.now().toIso8601String(),
      "team1": _team1Controller.text,
      "team2": _team2Controller.text,
      "sets": _sets,
      "team1_details": {
        "S1": _sets.isNotEmpty ? _sets[0]["team1"] : 0,
        "S2": _sets.length > 1 ? _sets[1]["team1"] : 0,
        "S3": _sets.length > 2 ? _sets[2]["team1"] : 0,
        "result": team1Wins,
        "score": team1Wins,
        "point": team1PointsTotal,
      },
      "team2_details": {
        "S1": _sets.isNotEmpty ? _sets[0]["team2"] : 0,
        "S2": _sets.length > 1 ? _sets[1]["team2"] : 0,
        "S3": _sets.length > 2 ? _sets[2]["team2"] : 0,
        "result": team2Wins,
        "score": team2Wins,
        "point": team2PointsTotal,
      },
    };

    try {
      if (_matchId == null) {
        // Crear un nuevo documento
        final docRef = await FirebaseFirestore.instance
            .collection("volleyball_matches")
            .add(matchData);
        _matchId = docRef.id; // Guardar el ID del documento
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Partido creado con éxito!")),
        );
      } else {
        // Actualizar el documento existente
        await FirebaseFirestore.instance
            .collection("volleyball_matches")
            .doc(_matchId)
            .update(matchData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Partido creado con éxito!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $e")),
      );
    }
  }

  void _addControllersForSet(int index) {
    if (_team1PointsControllers.length <= index) {
      _team1PointsControllers.add(TextEditingController());
      _team2PointsControllers.add(TextEditingController());
    }
    if (_sets.length > index) {
      _team1PointsControllers[index].text = _sets[index]["team1"].toString();
      _team2PointsControllers[index].text = _sets[index]["team2"].toString();
    }
  }

  @override
  void dispose() {
    _team1Controller.dispose();
    _team2Controller.dispose();
    for (final controller in _team1PointsControllers) {
      controller.dispose();
    }
    for (final controller in _team2PointsControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de puntos volleyball"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputText(
                  controller: _team1Controller,
                  labelText: "Equipo local",
                  keyboardType: TextInputType.text,
                  onChangedText: (value) {
                    log(value);
                  },
                ),
                gap16,
                InputText(
                  controller: _team2Controller,
                  labelText: "Equipo visitante",
                  keyboardType: TextInputType.text,
                  onChangedText: (value) {
                    log(value);
                  },
                ),
                gap16,
                Wrap(
                  children: List.generate(_currentSet, (index) {
                    _addControllersForSet(index);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "${index + 1} Set",
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80,
                                child: InputText(
                                  controller: _team1PointsControllers[index],
                                  labelText: "Puntos",
                                  onChangedText: (value) {
                                    log(value);
                                  },
                                ),
                              ),
                              space8,
                              SizedBox(
                                width: 80,
                                child: InputText(
                                  controller: _team2PointsControllers[index],
                                  labelText: "Puntos",
                                  onChangedText: (value) {
                                    log(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentSet < _maxSets)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              setState(() {
                                _currentSet++;
                              });
                            }
                          },
                          child: Text("Siguiente set"),
                        ),
                      ),
                    space16,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            setState(() {
                              _saveMatch();
                            });
                          }
                        },
                        child: Text("Guardar"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
