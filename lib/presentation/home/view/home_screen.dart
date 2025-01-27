import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../src/models/models.dart';
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
        backgroundColor: ComColors.blue500,
        foregroundColor: ComColors.white,
        centerTitle: true,
        title: Text(
          'Inicio',
          style: ComTextStyle.h6.white,
        ),
        actions: [
          CustomPopupMenu(
            options: [
              MenuItems(
                title: 'Registro de puntos',
                icon: Icons.add,
                onOptionSelected: () {},
              ),
              MenuItems(
                title: 'Tabla de puntos',
                icon: Icons.bar_chart,
                onOptionSelected: () {
                  autoRouterPush(context, TablePointsVoleyRoute());
                },
              ),
              MenuItems(
                title: 'Tabla de Resultados',
                icon: Icons.show_chart,
                onOptionSelected: () {
                  autoRouterPush(context, TableResultVoleyRoute());
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ds16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CardTournament(
                tournaments: viewModel.tournaments,
                onPressed: (tournament) {
                  autoRouterPush(context,
                      TournamentDetailRoute(tournamentData: tournament));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
