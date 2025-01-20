import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../widgets/widgets.dart';
import 'drawer_menu_header_vm.dart';

@RoutePage()
class DrawerMenuHeaderScreen extends StatelessWidget {
  const DrawerMenuHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DrawerMenuHeaderVm(),
      child: Consumer<DrawerMenuHeaderVm>(builder: (context, viewModel, _) {
        return Drawer(
          backgroundColor: ComColors.succ500,
          elevation: 40,
          width: 340,
          child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: DrawerOptions(
              options: ['Inicio', 'Mi Perfil', 'Acerca de nosotros'],
              onLogout: () {},
              name: viewModel.playerName,
              playerPhotoUrl: viewModel.playerPhotoUrl ??
                  'https://example.com/default-avatar.png',
            ),
          ),
        );
      }),
    );
  }
}
