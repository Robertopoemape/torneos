import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../src/models/models.dart';
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
          backgroundColor: ComColors.blue500,
          elevation: 40,
          width: 340,
          child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: DrawerOptions(
              options: [
                MenuItems(
                    onOptionSelected: () {
                      autoRouterPop(context);
                    },
                    title: 'Inicio'),
                MenuItems(onOptionSelected: () {}, title: 'Mi perfil'),
                MenuItems(onOptionSelected: () {}, title: 'Acerca de nosotros'),
              ],
              onLogout: () {},
              name: viewModel.playerName,
              playerPhotoUrl: ComSvg.notImg.path,
            ),
          ),
        );
      }),
    );
  }
}
