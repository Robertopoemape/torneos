import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';

import 'tournament_detail_vm.dart';

@RoutePage()
class TournamentDetailScreen extends StatelessWidget {
  const TournamentDetailScreen({
    super.key,
    required this.tournamentId,
  });
  final String tournamentId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TournamentDetailVm(tournamentId),
      child: const TournamentScreenContent(),
    );
  }
}

class TournamentScreenContent extends StatelessWidget {
  const TournamentScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TournamentDetailVm>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewModel.tournament.nameTournament,
          style: ComTextStyle.h6.gsWhite,
        ),
        backgroundColor: ComColors.succ500,
        foregroundColor: ComColors.gsWhite,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.tournament.description,
              style: const TextStyle(fontSize: 16),
            ),
            gap16,
            Row(
              children: [
                const Icon(Icons.calendar_today, size: ds20),
                space8,
                Text(
                  'Fecha de inicio: ${viewModel.tournament.startDate}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            gap8,
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20),
                space8,
                Text(
                  "Fecha de finalización: ${viewModel.tournament.endDate}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            gap8,
            Row(
              children: [
                const Icon(Icons.location_on, size: 20),
                space8,
                Text(
                  "Lugar: ${viewModel.tournament.location}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            gap24,
            const Text(
              "Partidos:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            gap8,
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.tournament.matches.length,
                itemBuilder: (context, index) {
                  final match = viewModel.tournament.matches[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title:
                          Text("${match.teamLocal} vs ${match.teamVisitante}"),
                      subtitle: Text(
                        "Fecha: ${match.date} | Hora: ${match.hour}",
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        autoRouterPush(context, VolleyballMatchesRoute());
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
