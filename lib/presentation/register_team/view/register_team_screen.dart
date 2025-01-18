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
                    ComInputText(
                      controller: controller.teamNameController,
                      labelText: 'Nombre del Equipo',
                      keyboardType: TextInputType.text,
                      borderColor: ComColors.acce300,
                    ),
                    ComInputText(
                      controller: controller.coachNameController,
                      labelText: 'Nombre del Entrenador',
                      keyboardType: TextInputType.text,
                      borderColor: ComColors.acce300,
                    ),
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
                          child: ComInputText(
                            controller: controller.numberDocumentController,
                            labelText: 'Número de Documento',
                          ),
                        ),
                      ],
                    ),
                    ComInputText(
                      controller: controller.lastNameController,
                      labelText: 'Nombres',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.nameController,
                      labelText: 'Apellidos',
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ComInputText(
                            controller: controller.nameController,
                            labelText: 'Nick name',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        space16,
                        SizedBox(
                          width: 110,
                          child: ComInputText(
                            controller: controller.numberShirtController,
                            labelText: 'Nº Camiseta',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ComDropdown(
                            controller: controller.positionPlayerController,
                            items: [
                              'Defensa derecha',
                              'Armador',
                              'Central',
                              'Atacante punta',
                              'Defensa izquierda',
                              'Defensa central'
                            ],
                            hintText: 'Posición del jugador',
                            onChanged: (value) {
                              viewModel.selectedDocumentType = value;
                            },
                          ),
                        ),
                        space16,
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: ComColors.sec500,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
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
}
