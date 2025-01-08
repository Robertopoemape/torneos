import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_torneos/presentation/score_register/controller/score_register_controller.dart';

import '../../components/input_text.dart';
import '../../core/common/common.dart';
import '../../core/style/style.dart';
import '../../src/models/models.dart';

class ScoreRegisterScreen extends StatefulWidget {
  const ScoreRegisterScreen({super.key});

  @override
  State<ScoreRegisterScreen> createState() => _ScoreRegisterScreenState();
}

class _ScoreRegisterScreenState extends State<ScoreRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> saveMatchData(MatchData matchData) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final querySnapshot = await firestore.collection('matches').get();
      final newPosition = querySnapshot.docs.length + 1;

      final matchDataWithPosition = MatchData(
        teamName: matchData.teamName,
        position: newPosition,
        stats: matchData.stats,
      );

      await firestore.collection('matches').add(matchDataWithPosition.toMap());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos guardados exitosamente')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar datos: $e')),
        );
      }
    }
  }

  MatchData? _createMatchData() {
    try {
      final stats = MatchStats(
        played: _parseInt('played'),
        won: _parseInt('won'),
        lost: _parseInt('lost'),
        setsFor: _parseInt('setsFor'),
        setsAgainst: _parseInt('setsAgainst'),
        diffSets: _parseInt('diffSets'),
        ratioSets: _parseDouble('ratioSets'),
        totalPointsFor: _parseInt('pointsFor'),
        totalPointsAgainst: _parseInt('pointsAgainst'),
        diffPoints: _parseInt('diffPoints'),
        ratioPoints: _parseDouble('ratioPoints'),
        twoZero: _parseInt('twoZero'),
        twoOne: _parseInt('twoOne'),
        oneTwo: _parseInt('oneTwo'),
        zeroTwo: _parseInt('zeroTwo'),
      );

      return MatchData(
        teamName: ScoreRegisterController.controllers['teamName']!.text,
        stats: stats,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, verifica los campos')),
      );
      return null;
    }
  }

  int _parseInt(String key) {
    return int.tryParse(ScoreRegisterController.controllers[key]!.text) ?? 0;
  }

  double _parseDouble(String key) {
    return double.tryParse(ScoreRegisterController.controllers[key]!.text) ??
        0.0;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScoreRegisterController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registro de puntaje'),
          centerTitle: true,
          backgroundColor: ComColors.succ500,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildFormCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader('Registrar Datos', Icons.edit),
              gap16,
              _buildInput('teamName', 'Nombre de equipo', TextInputType.text),
              gap8,
              const Divider(),
              _buildSection('Partidos', Icons.sports_volleyball, [
                _buildRow(['played', 'won', 'lost'],
                    ['Jugados', 'Ganados', 'Perdidos']),
              ]),
              const Divider(),
              _buildSection('Sets', Icons.bar_chart, [
                _buildRow(['setsFor', 'setsAgainst', 'diffSets'],
                    ['A favor', 'En contra', 'Diferencia']),
                gap16,
                _buildInput('ratioSets', 'Ratio de sets', TextInputType.number),
              ]),
              const Divider(),
              _buildSection('Puntos', Icons.score, [
                _buildRow(['pointsFor', 'pointsAgainst', 'diffPoints'],
                    ['A favor', 'En contra', 'Diferencia']),
                gap16,
                _buildInput(
                    'ratioPoints', 'Ratio de puntos', TextInputType.number),
              ]),
              const Divider(),
              _buildSection('Resultados detallados', Icons.table_chart, [
                _buildRow(['twoZero', 'twoOne', 'oneTwo', 'zeroTwo'],
                    ['2 a 0', '2 a 1', '1 a 2', '0 a 2']),
              ]),
              gap16,
              Center(
                child: SizedBox(
                  width: double.infinity, // Ocupa todo el ancho disponible
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final matchData = _createMatchData();
                        if (matchData != null) {
                          saveMatchData(matchData);
                        }
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: ComColors.succ500,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      textStyle: ComTextStyle.button2,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: ComColors.sec500, size: 28),
        space8,
        Text(title, style: ComTextStyle.h6.w700),
      ],
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: ComColors.succ500),
            space8,
            Text(title, style: ComTextStyle.subtitle1),
          ],
        ),
        gap8,
        ...children,
        gap8,
      ],
    );
  }

  Widget _buildRow(List<String> keys, List<String> labels) {
    return Row(
      children: [
        for (int i = 0; i < keys.length; i++) ...[
          Expanded(
              child: _buildInput(keys[i], labels[i], TextInputType.number)),
          if (i != keys.length - 1) const SizedBox(width: 16),
        ],
      ],
    );
  }

  Widget _buildInput(String key, String label, TextInputType keyboardType) {
    return InputText(
      controller: ScoreRegisterController.controllers[key]!,
      labelText: label,
      keyboardType: keyboardType,
    );
  }
}
