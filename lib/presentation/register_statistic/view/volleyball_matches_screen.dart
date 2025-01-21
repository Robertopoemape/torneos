import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/models/models.dart';
import '../register_statistic.dart';

@RoutePage()
class VolleyballMatchesScreen extends StatelessWidget {
  const VolleyballMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VolleyballMatchesController()),
        ChangeNotifierProvider(
            create: (context) => VolleyballMatchesVm(context.read())),
      ],
      child: Consumer<VolleyballMatchesVm>(builder: (context, viewModel, _) {
        final controller = context.read<VolleyballMatchesController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ComColors.succ500,
            foregroundColor: ComColors.gsWhite,
            centerTitle: true,
            title: Text(
              'Registro de puntos volleyball',
              style: ComTextStyle.h6.gsWhite,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(ds16),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComDropdown(
                      controller: controller.localTeamController,
                      items: ['equipo1'],
                      hintText: 'Nombre del Equipo',
                    ),
                    ComDropdown(
                      controller: controller.visitantTeamController,
                      items: ['equipo2'],
                      hintText: 'Nombre del Entrenador',
                    ),
                    gap16,
                    Wrap(
                      children: List.generate(viewModel.currentSets, (index) {
                        viewModel.addControllersForSet(index);
                        return Padding(
                          padding: const EdgeInsets.only(right: ds8),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: ds8),
                                child: Text(
                                  "${index + 1} Set",
                                ),
                              ),
                              Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: ComInputText(
                                      controller: controller
                                          .team1PointsControllers[index],
                                      labelText: 'Local',
                                      onChangedText: (value) {
                                        if (viewModel.sets.length <= index) {
                                          viewModel.sets.add(SetScore(
                                              localteam: 0, visitantTeam: 0));
                                        }
                                        viewModel.sets[index] =
                                            viewModel.sets[index].copyWith(
                                          localteam: int.tryParse(value) ?? 0,
                                        );
                                      },
                                    ),
                                  ),
                                  space8,
                                  SizedBox(
                                    width: 80,
                                    child: ComInputText(
                                      controller: controller
                                          .team2PointsControllers[index],
                                      labelText: 'Visitante',
                                      onChangedText: (value) {
                                        if (viewModel.sets.length <= index) {
                                          viewModel.sets.add(SetScore(
                                              localteam: 0, visitantTeam: 0));
                                        }
                                        viewModel.sets[index] =
                                            viewModel.sets[index].copyWith(
                                          visitantTeam:
                                              int.tryParse(value) ?? 0,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    gap16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (viewModel.currentSets < viewModel.maxSets)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.formKey.currentState!.save();
                                  viewModel.currentSets++;
                                }
                              },
                              child: Text('Siguiente set'),
                            ),
                          ),
                        space16,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.formKey.currentState!.save();
                                viewModel.saveMatch(context);
                              }
                            },
                            child: Text('Guardar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
