import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/com_time_picker.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../register_tournament.dart';
import '../widgets/widgets.dart';

@RoutePage()
class RegisterTournamentScreen extends StatelessWidget {
  const RegisterTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterTournamentController()),
        ChangeNotifierProvider(
            create: (context) => RegisterTournamentVm(context.read())),
      ],
      child: Consumer<RegisterTournamentVm>(
        builder: (context, viewModel, _) {
          final controller = context.read<RegisterTournamentController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ComColors.blue500,
              foregroundColor: ComColors.white,
              centerTitle: true,
              title: Text(
                'Registra tu torneo',
                style: ComTextStyle.h6.white,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(ds16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: ds4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ds16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ds16),
                        child: Column(
                          children: [
                            _buildSectionTitle('Datos del Torneo'),
                            _buildTextInput(
                              controller: controller.nameController,
                              labelText: 'Nombre del Torneo',
                            ),
                            _buildTextInput(
                              controller: controller.descriptionController,
                              labelText: 'Descripción',
                            ),
                            _buildDatePicker(
                              labelText: 'Fecha de Inicio',
                              onDateSelected: (date) {},
                            ),
                            _buildDatePicker(
                              labelText: 'Fecha de finalización',
                              onDateSelected: (date) {},
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextInput(
                                    controller: controller.locationController,
                                    labelText: 'Ubicación',
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    viewModel.openFullScreenMap(context);
                                  },
                                  icon: const Icon(Icons.location_on_outlined),
                                ),
                              ],
                            ),
                            _buildTextInput(
                              controller: controller.stadiumController,
                              labelText: 'Estadio',
                            ),
                          ],
                        ),
                      ),
                    ),
                    gap8,
                    ComDivider(),
                    gap8,
                    Card(
                      elevation: ds4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ds16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(ds16),
                        child: Column(
                          children: [
                            _buildSectionTitle('Registrar Partidos'),
                            _buildDatePicker(
                              labelText: 'Fecha de Inicio',
                              onDateSelected: (date) {},
                            ),
                            ComTimePicker(
                              matchHourController:
                                  controller.matchDateController,
                              matchMinutesController:
                                  controller.matchMinutesController,
                            ),
                            _buildTextInput(
                              controller: controller.teamLocalController,
                              labelText: 'Equipo Local',
                            ),
                            _buildTextInput(
                              controller: controller.teamVisitantController,
                              labelText: 'Equipo Visitante',
                            ),
                            gap4,
                            ComButton(
                              onPressed: viewModel.addMatch,
                              text: 'Agregar',
                              height: ds25,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: ds10),
                              backgroundColor: null,
                              labelColor: ComColors.blue600,
                              borderColor: Colors.transparent,
                              isActivatedIcon: true,
                            ),
                            if (viewModel.matches.isNotEmpty) ...[
                              gap4,
                              MatchList(
                                matches: viewModel.matches,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    gap16,
                    ComButton(
                      alignment: Alignment.center,
                      onPressed: () {
                        viewModel.registerTournament(context);
                      },
                      text: 'Registrar Torneo y Partidos',
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

  Widget _buildTextInput({
    required TextEditingController controller,
    required String labelText,
  }) {
    return ComInputText(
      controller: controller,
      labelText: labelText,
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildDatePicker({
    required String labelText,
    required Function(DateTime?) onDateSelected,
  }) {
    return ComDatePicker.dateSelection(
      labelText: labelText,
      initialDate: DateTime.now(),
      onDateSelected: onDateSelected,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: ComTextStyle.h6);
  }
}
