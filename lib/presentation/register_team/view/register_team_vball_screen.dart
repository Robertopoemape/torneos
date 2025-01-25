import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../controller/register_team_vball_controller.dart';
import '../widgets/show_selection_dialog.dart';
import 'register_team_vball_vm.dart';

@RoutePage()
class RegisterTeamVballScreen extends StatelessWidget {
  const RegisterTeamVballScreen({super.key});

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
                    ),
                    ComInputText(
                      controller: controller.coachNameController,
                      labelText: 'Nombre del Entrenador',
                      keyboardType: TextInputType.text,
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
                      controller: controller.nameController,
                      labelText: 'Nombres',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.lastNameController,
                      labelText: 'Apellidos',
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ComInputText(
                            controller: controller.nickNameController,
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
                              viewModel.selectedPositionPlayer = value;
                            },
                          ),
                        ),
                        space16,
                        SizedBox(
                          height: 48,
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              showSelectionDialog(
                                  context: context,
                                  onTapGalery: () {
                                    viewModel.openGallery();
                                    autoRouterPop(context);
                                  },
                                  onTapCamera: () {
                                    viewModel.openCamera();
                                    autoRouterPop(context);
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
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
                    ComDatePicker.dateSelection(
                      labelText: 'Fecha de nacimiento',
                      initialDate: DateTime(2000, 1, 1),
                      onDateSelected: (date) {
                        if (date != null) {}
                      },
                    ),
                    if (viewModel.imgFileUpload != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            viewModel.imgFileUpload!,
                            fit: BoxFit.cover,
                          ),
                        ),
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
