import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolleyballMatchesScreen extends StatefulWidget {
  const VolleyballMatchesScreen({super.key});

  @override
  _VolleyballMatchesScreenState createState() =>
      _VolleyballMatchesScreenState();
}

class _VolleyballMatchesScreenState extends State<VolleyballMatchesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _team1Controller = TextEditingController();
  final TextEditingController _team2Controller = TextEditingController();
  final List<Map<String, int>> _sets = [];
  int _currentSet = 1;
  final int _maxSets = 5;
  String? _matchId; // ID del partido en Firestore

  void _addSet(int team1Points, int team2Points) {
    if (_sets.length < _currentSet) {
      _sets.add({"team1": team1Points, "team2": team2Points});
    } else {
      _sets[_currentSet - 1] = {"team1": team1Points, "team2": team2Points};
    }
  }

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
        "resultado": team1Wins,
        "puntaje": team1Wins,
        "puntos": team1PointsTotal,
      },
      "team2_details": {
        "S1": _sets.isNotEmpty ? _sets[0]["team2"] : 0,
        "S2": _sets.length > 1 ? _sets[1]["team2"] : 0,
        "S3": _sets.length > 2 ? _sets[2]["team2"] : 0,
        "resultado": team2Wins,
        "puntaje": team2Wins,
        "puntos": team2PointsTotal,
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
          SnackBar(content: Text("Match created successfully!")),
        );
      } else {
        // Actualizar el documento existente
        await FirebaseFirestore.instance
            .collection("volleyball_matches")
            .doc(_matchId)
            .update(matchData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Match updated successfully!")),
        );
      }

      setState(() {
        _sets.clear();
        _currentSet = 1;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volleyball Matches"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _team1Controller,
                  decoration: InputDecoration(labelText: "Team 1 Name"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter Team 1 name" : null,
                ),
                TextFormField(
                  controller: _team2Controller,
                  decoration: InputDecoration(labelText: "Team 2 Name"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter Team 2 name" : null,
                ),
                SizedBox(height: 20),
                Column(
                  children: List.generate(_currentSet, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Set ${index + 1} Scores"),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: "Team 1 Points"),
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? "Enter points" : null,
                                onSaved: (value) {
                                  if (value != null) {
                                    final team1Points = int.parse(value);
                                    final team2Points = _sets.length > index
                                        ? _sets[index]["team2"] ?? 0
                                        : 0;
                                    _addSet(team1Points, team2Points);
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: "Team 2 Points"),
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    value!.isEmpty ? "Enter points" : null,
                                onSaved: (value) {
                                  if (value != null) {
                                    final team2Points = int.parse(value);
                                    final team1Points = _sets.length > index
                                        ? _sets[index]["team1"] ?? 0
                                        : 0;
                                    _addSet(team1Points, team2Points);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            _currentSet++;
                          });
                        }
                      },
                      child: Text("Next Set"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            _saveMatch();
                          });
                        }
                      },
                      child: Text("Save Match"),
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
