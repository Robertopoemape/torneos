import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../core/style/style.dart';
import 'widgets/drawer_options.dart';

@RoutePage()
class DrawerMenuHeader extends StatelessWidget {
  const DrawerMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
  }
}
