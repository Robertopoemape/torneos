import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../register_tournament.dart';

@RoutePage()
class RegisterTournamentScreen extends StatefulWidget {
  const RegisterTournamentScreen({super.key});

  @override
  RegisterTournamentScreenState createState() =>
      RegisterTournamentScreenState();
}

class RegisterTournamentScreenState extends State<RegisterTournamentScreen> {
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
              backgroundColor: ComColors.succ500,
              foregroundColor: ComColors.gsWhite,
              centerTitle: true,
              title: Text(
                'Registro de Torneo',
                style: ComTextStyle.h6.gsWhite,
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
                              _buildTextInput(
                                controller: controller.locationController,
                                labelText: 'Ubicación',
                              ),
                              _buildTextInput(
                                controller: controller.stadiumController,
                                labelText: 'Estadio',
                              ),
                            ],
                          ),
                        )),
                    gap16,
                    ComDivider(),
                    gap16,
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
                            _buildTextInput(
                              controller: controller.matchHourController,
                              labelText: 'Hora del Partido',
                            ),
                            _buildTextInput(
                              controller: controller.teamLocalController,
                              labelText: 'Equipo Local',
                            ),
                            _buildTextInput(
                              controller: controller.teamVisitanteController,
                              labelText: 'Equipo Visitante',
                            ),
                            gap8,
                            _buildElevatedButton(
                              onPressed: viewModel.addMatch,
                              text: 'Agregar Partido',
                            ),
                            if (viewModel.matches.isNotEmpty) ...[
                              gap8,
                              _buildMatchList(viewModel),
                            ]
                          ],
                        ),
                      ),
                    ),
                    gap30,
                    Center(
                      child: _buildElevatedButton(
                        onPressed: () {
                          viewModel.registerTournament(context);
                        },
                        text: 'Registrar Torneo y Partidos',
                        padding: const EdgeInsets.symmetric(
                            horizontal: ds24, vertical: ds12),
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

  Widget _buildElevatedButton({
    required VoidCallback onPressed,
    required String text,
    EdgeInsets? padding,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: onPressed,
        iconAlignment: IconAlignment.end,
        style: ElevatedButton.styleFrom(
          backgroundColor: ComColors.succ500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: ds12),
          child: Text(text, style: ComTextStyle.button1.gsWhite),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: ComTextStyle.h6);
  }

  Widget _buildMatchList(RegisterTournamentVm viewModel) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: viewModel.matches.length,
      itemBuilder: (context, index) {
        final match = viewModel.matches[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: ds8),
          child: ListTile(
            title: Text(
              '${match.teamLocal} vs ${match.teamVisitante}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${match.dateStart} - ${match.hour}'),
            trailing: Icon(Icons.delete, color: ComColors.err500),
            onTap: () {
              viewModel.removeMatchAt(index);
            },
          ),
        );
      },
    );
  }
}
