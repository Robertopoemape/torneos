import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/input_text.dart';
import '../../core/style/style.dart';
import '../../src/models/models.dart';

class ScoreRegisterScreen extends StatefulWidget {
  const ScoreRegisterScreen({required this.onAddData, super.key});

  final Function(MatchData) onAddData;

  @override
  State<ScoreRegisterScreen> createState() => _ScoreRegisterScreenState();
}

class _ScoreRegisterScreenState extends State<ScoreRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final teamNameController = TextEditingController();
  final playedController = TextEditingController();
  final wonController = TextEditingController();
  final lostController = TextEditingController();
  final setsForController = TextEditingController();
  final setsAgainstController = TextEditingController();
  final diffSetsController = TextEditingController();
  final ratioSetsController = TextEditingController();
  final pointsForController = TextEditingController();
  final pointsAgainstController = TextEditingController();
  final diffPointsController = TextEditingController();
  final ratioPointsController = TextEditingController();
  final twoZeroController = TextEditingController();
  final twoOneController = TextEditingController();
  final oneTwoController = TextEditingController();
  final zeroTwoController = TextEditingController();

// Método para guardar datos en Firestore
  Future<void> saveMatchData(MatchData matchData) async {
    try {
      final firestore = FirebaseFirestore.instance;

      // Serializa los datos de MatchData
      final data = {
        'teamName': matchData.teamName,
        'position': matchData.position,
        'stats': {
          'played': matchData.stats.played,
          'won': matchData.stats.won,
          'lost': matchData.stats.lost,
          'setsFor': matchData.stats.setsFor,
          'setsAgainst': matchData.stats.setsAgainst,
          'diffSets': matchData.stats.diffSets,
          'ratioSets': matchData.stats.ratioSets,
          'totalPointsFor': matchData.stats.totalPointsFor,
          'totalPointsAgainst': matchData.stats.totalPointsAgainst,
          'diffPoints': matchData.stats.diffPoints,
          'ratioPoints': matchData.stats.ratioPoints,
          'twoZero': matchData.stats.twoZero,
          'twoOne': matchData.stats.twoOne,
          'oneTwo': matchData.stats.oneTwo,
          'zeroTwo': matchData.stats.zeroTwo,
        }
      };

      // Guarda los datos en una colección "matches"
      await firestore.collection('matches').add(data);
      print('Datos guardados exitosamente');
    } catch (e) {
      print('Error al guardar datos: $e');
    }
  }

  @override
  void dispose() {
    teamNameController.dispose();
    playedController.dispose();
    wonController.dispose();
    lostController.dispose();
    setsForController.dispose();
    setsAgainstController.dispose();
    diffSetsController.dispose();
    ratioSetsController.dispose();
    pointsForController.dispose();
    pointsAgainstController.dispose();
    diffPointsController.dispose();
    ratioPointsController.dispose();
    twoZeroController.dispose();
    twoOneController.dispose();
    oneTwoController.dispose();
    zeroTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Datos'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        color: ComColors.inf200,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registrar Datos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    controller: TextEditingController(),
                    labelText: 'Nombre de equipo',
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  Text('Partidos', style: ComTextStyle.subtitle1),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'Jugados',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'Ganados',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'Perdidos',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Sets', style: ComTextStyle.subtitle1),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'A favor',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'En contra',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'En diferencia',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    controller: TextEditingController(),
                    labelText: 'Ratio de sets',
                  ),
                  const SizedBox(height: 16),
                  Text('Puntos', style: ComTextStyle.subtitle1),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'A favor',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'En contra',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: 'En diferencia',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    controller: TextEditingController(),
                    labelText: 'Ratio de puntos',
                  ),
                  const SizedBox(height: 16),
                  Text('Resultados detallados', style: ComTextStyle.subtitle1),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: '2 a 0',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: '2 a 1',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: '1 a 2',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InputText(
                          controller: TextEditingController(),
                          labelText: '0 a 2',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Crea los datos de MatchStats y MatchData
                          final stats = MatchStats(
                            played: int.parse(playedController.text),
                            won: int.parse(wonController.text),
                            lost: int.parse(lostController.text),
                            setsFor: int.parse(setsForController.text),
                            setsAgainst: int.parse(setsAgainstController.text),
                            diffSets: int.parse(diffSetsController.text),
                            ratioSets: double.parse(ratioSetsController.text),
                            totalPointsFor: int.parse(pointsForController.text),
                            totalPointsAgainst:
                                int.parse(pointsAgainstController.text),
                            diffPoints: int.parse(diffPointsController.text),
                            ratioPoints:
                                double.parse(ratioPointsController.text),
                            twoZero: int.parse(twoZeroController.text),
                            twoOne: int.parse(twoOneController.text),
                            oneTwo: int.parse(oneTwoController.text),
                            zeroTwo: int.parse(zeroTwoController.text),
                          );

                          final matchData = MatchData(
                            teamName: teamNameController.text,
                            stats: stats,
                          );

                          // Llama al método para guardar en Firestore
                          saveMatchData(matchData);
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Agregar Datos'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
