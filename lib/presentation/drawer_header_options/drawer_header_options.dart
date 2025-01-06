import 'package:flutter/material.dart';
import 'package:proyecto_torneos/presentation/drawer_header_options/widgets/photo_user_profile.dart';

import '../../core/common/app_gap.dart';
import '../../core/style/style.dart';

class DrawerHeaderOptions extends StatelessWidget {
  const DrawerHeaderOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ComColors.succ500,
      elevation: 40,
      width: 340,
      child: DrawerHeader(
        margin: EdgeInsets.zero, // Elimina el margen
        padding: EdgeInsets.symmetric(
            horizontal: 16, vertical: 16), // Elimina el padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*ImgSvgAL(
                  pathNetwork: AppAsset.shield,
                  height: 35,
                  width: 35,
                  isLocal: true,
                ),*/
                Spacer(),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),*/
            PhotoUserProfile(
              lblTitle: 'Imagen',
              lblCode: '',
              code: '',
              onPressedOpenDrawer: () {},
            ),
            gap16,
            Text(
              'Inicio',
              style: ComTextStyle.body1.gsWhite,
            ),
            Divider(
              color: ComColors.gs500,
              thickness: 0.5,
            ),
            Text(
              'Mi Perfil',
              style: ComTextStyle.body1.gsWhite,
            ),
            Divider(
              color: ComColors.gs500,
              thickness: 0.5,
            ),
            Text(
              'Acerca de nosotros',
              style: ComTextStyle.body1.gsWhite,
            ),
            Divider(
              color: ComColors.gs500,
              thickness: 0.5,
            ),
            Spacer(),
            Divider(
              color: ComColors.gs500,
              thickness: 0.5,
            ),
            Text(
              'Cerrar sesión',
              style: ComTextStyle.body1.gsWhite,
            ),
            gap24,
          ],
        ),
      ),
    );
  }
}
