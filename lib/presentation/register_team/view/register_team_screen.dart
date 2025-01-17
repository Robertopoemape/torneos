import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../controller/register_team_controller.dart';
import 'register_team_vm.dart';

class RegisterTeamScreen extends StatelessWidget {
  const RegisterTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterTeamController()),
        ChangeNotifierProvider(
            create: (context) => RegisterTeamVm(context.read())),
      ],
      child: Consumer<RegisterTeamVm>(
        builder: (context, viewModel, _) {
          final controller = context.read<RegisterTeamController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ComColors.succ500,
              foregroundColor: ComColors.gsWhite,
              centerTitle: true,
              title: Text(
                'Registro de equipos',
                style: ComTextStyle.h6.gsWhite,
              ),
            ),
            body: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    _buildInput(
                        controller.teamNameController, 'Nombre del Equipo'),
                    _buildInput(controller.coachNameController,
                        'Nombre del Entrenador'),
                    Text('Registro de jugadores', style: ComTextStyle.h6),
                    Row(
                      children: [
                        Expanded(
                          child: ComDropdown(
                            controller: controller.typeDocumentController,
                            items: ['DNI', 'CE'],
                            hintText: 'Tipo de Documento',
                            onChanged: (value) {
                              viewModel.selectedDocumentType = value;
                            },
                          ),
                        ),
                        space16,
                        Expanded(
                          child: _buildInput(
                              controller.numberDocumentController,
                              'Número de Documento'),
                        ),
                      ],
                    ),
                    _buildInput(controller.nameController, 'Nombres'),
                    _buildInput(controller.lastNameController, 'Apellidos'),
                    _buildInput(
                        controller.numberShirtController, 'Número de camiseta'),
                    Center(
                      child: ElevatedButton(
                        onPressed: viewModel.addTeam,
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
        },
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String label) {
    return ComInputText(
      controller: controller,
      labelText: label,
      keyboardType: TextInputType.text,
      borderColor: ComColors.acce300,
    );
  }
}
