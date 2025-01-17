import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_torneos/components/components.dart';

import '../../../core/core.dart';

@RoutePage()
class RegisterTeamScreen extends StatefulWidget {
  const RegisterTeamScreen({super.key});

  @override
  State<RegisterTeamScreen> createState() => _RegisterTeamScreenState();
}

class _RegisterTeamScreenState extends State<RegisterTeamScreen> {
  final _formKey = GlobalKey<FormState>();
  final _teamNameController = TextEditingController();
  final _coachNameController = TextEditingController();
  final _numberOfPlayersController = TextEditingController();

  @override
  void dispose() {
    _teamNameController.dispose();
    _coachNameController.dispose();
    _numberOfPlayersController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final teamName = _teamNameController.text;
      final coachName = _coachNameController.text;
      final numberOfPlayers =
          int.tryParse(_numberOfPlayersController.text) ?? 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Equipo registrado: $teamName (Entrenador: $coachName, Jugadores: $numberOfPlayers)"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ComColors.succ500,
        centerTitle: true,
        title: Text(
          'Registro de equipos',
          style: ComTextStyle.h6.gsWhite,
        ),
        actions: [SizedBox.shrink()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              gap4,
              ComInputText(
                controller: _teamNameController,
                labelText: 'Nombre del Equipo',
                keyboardType: TextInputType.text,
                borderColor: ComColors.acce300,
                onChangedText: (value) {
                  log(value);
                },
              ),
              gap16,
              ComInputText(
                controller: _coachNameController,
                labelText: 'Nombre del Entrenador',
                keyboardType: TextInputType.text,
                borderColor: ComColors.acce300,
                onChangedText: (value) {
                  log(value);
                },
              ),
              gap16,
              Text('Registro de jugadores', style: ComTextStyle.h6),
              ComDropdown(
                items: ['DNI', 'CE'],
                hintText: 'Tipo de Documento',
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Registrar Equipo'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
