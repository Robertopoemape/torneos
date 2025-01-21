import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../drawer_menu_header/drawer_menu_header.dart';
import '../home.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeVm(),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVm>();

    return Scaffold(
      drawer: const DrawerMenuHeaderScreen(),
      appBar: AppBar(
        backgroundColor: ComColors.succ500,
        foregroundColor: ComColors.gsWhite,
        centerTitle: true,
        title: Text(
          'Inicio',
          style: ComTextStyle.h6.gsWhite,
        ),
        actions: [
          CustomPopupMenu(
            onOptionSelected: (value) {
              if (value == 1) {
                autoRouterPush(context, VolleyballMatchesRoute());
              } else if (value == 2) {
                autoRouterPush(context, ResultTableRoute());
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CardTournament(
                tournaments: viewModel.tournaments,
                onPressed: (index) {
                  autoRouterPush(
                      context, TournamentDetailRoute(tournamentId: index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
