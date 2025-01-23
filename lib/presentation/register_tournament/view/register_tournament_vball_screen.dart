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
                    ComInputText(
                      controller: controller.nameController,
                      labelText: 'Nombre del Torneo',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.descriptionController,
                      labelText: 'Descripción',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.startDateController,
                      labelText: 'Fecha de Inicio',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.endDateController,
                      labelText: 'Fecha de Finalización',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.locationController,
                      labelText: 'Ubicación',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.stadiumController,
                      labelText: 'Estadio',
                      keyboardType: TextInputType.text,
                    ),
                    gap30,
                    Divider(thickness: 1.5, color: ComColors.succ500),
                    gap20,
                    Text('Registrar Partidos', style: ComTextStyle.h6),
                    gap20,
                    ComInputText(
                      controller: controller.matchDateController,
                      labelText: 'Fecha del Partido',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.matchHourController,
                      labelText: 'Hora del Partido',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.teamLocalController,
                      labelText: 'Equipo Local',
                      keyboardType: TextInputType.text,
                    ),
                    ComInputText(
                      controller: controller.teamVisitanteController,
                      labelText: 'Equipo Visitante',
                      keyboardType: TextInputType.text,
                    ),
                    gap20,
                    ElevatedButton(
                      onPressed: viewModel.addMatch,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ComColors.succ500),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: ds12),
                        child: Text('Agregar Partido',
                            style: ComTextStyle.button1.gsWhite),
                      ),
                    ),
                    gap20,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: viewModel.matches.length,
                      itemBuilder: (context, index) {
                        final match = viewModel.matches[index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: ds8),
                          child: ListTile(
                            title: Text(
                                '${match.teamLocal} vs ${match.teamVisitante}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('${match.date} - ${match.hour}'),
                            trailing:
                                Icon(Icons.delete, color: ComColors.err500),
                            onTap: () {
                              viewModel.removeMatchAt(index);
                            },
                          ),
                        );
                      },
                    ),
                    gap30,
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.registerTournament(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ComColors.succ500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: ds12),
                          child: Text('Registrar Torneo y Partidos',
                              style: ComTextStyle.button1.gsWhite),
                        ),
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
