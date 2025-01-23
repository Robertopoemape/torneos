import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/models/models.dart';
import '../register_points.dart';

@RoutePage()
class RegisterSetsVballScreen extends StatelessWidget {
  const RegisterSetsVballScreen({
    required this.tournamentId,
    required this.localTeam,
    required this.visitantTeam,
    super.key,
  });

  final String tournamentId;
  final String localTeam;
  final String visitantTeam;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VolleyballMatchesController()),
        ChangeNotifierProvider(
          create: (context) => RegisterVoleySetsVm(
            context.read(),
            tournamentId,
            localTeam,
            visitantTeam,
          ),
        ),
      ],
      child: Consumer<RegisterVoleySetsVm>(
        builder: (context, viewModel, _) {
          final controller = context.read<VolleyballMatchesController>();
          return Scaffold(
            appBar: _buildAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(ds16),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTeamInputs(controller),
                      gap16,
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children:
                              List.generate(viewModel.currentSets, (index) {
                            viewModel.addControllersForSet(index);
                            return SetInputRow(
                              index: index,
                              localController:
                                  controller.team1PointsControllers[index],
                              visitantController:
                                  controller.team2PointsControllers[index],
                              onLocalScoreChanged: (value) {
                                _updateSetScore(
                                  viewModel,
                                  index,
                                  localScore: value,
                                );
                              },
                              onVisitantScoreChanged: (value) {
                                _updateSetScore(
                                  viewModel,
                                  index,
                                  visitantScore: value,
                                );
                              },
                            );
                          }),
                        ),
                      ),
                      gap16,
                      ActionButtons(
                        canAddSet: viewModel.currentSets < viewModel.maxSets,
                        onAddSet: () {
                          if (_validateAndSaveForm(controller)) {
                            viewModel.currentSets++;
                          }
                        },
                        onSave: () {
                          if (_validateAndSaveForm(controller)) {
                            viewModel.saveMatch(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ComColors.succ500,
      foregroundColor: ComColors.gsWhite,
      centerTitle: true,
      title: Text(
        'Registro de sets',
        style: ComTextStyle.h6.gsWhite,
      ),
    );
  }

  Widget _buildTeamInputs(VolleyballMatchesController controller) {
    return Column(
      children: [
        ComInputText(
          controller: controller.localTeamController,
          labelText: 'Equipo local',
          readOnly: true,
        ),
        ComInputText(
          controller: controller.visitantTeamController,
          labelText: 'Equipo visitante',
          readOnly: true,
        ),
      ],
    );
  }

  bool _validateAndSaveForm(VolleyballMatchesController controller) {
    final form = controller.formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _updateSetScore(
    RegisterVoleySetsVm viewModel,
    int index, {
    String? localScore,
    String? visitantScore,
  }) {
    if (viewModel.sets.length <= index) {
      viewModel.sets.add(SetScore(localteam: 0, visitantTeam: 0));
    }
    viewModel.sets[index] = viewModel.sets[index].copyWith(
      localteam: localScore != null ? int.tryParse(localScore) ?? 0 : null,
      visitantTeam:
          visitantScore != null ? int.tryParse(visitantScore) ?? 0 : null,
    );
  }
}
