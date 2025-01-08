import 'package:flutter/material.dart';
import 'package:proyecto_torneos/presentation/drawer_header_options/widgets/expansion_title_config.dart';

import '../../../core/common/common.dart';
import '../../../core/style/style.dart';
import 'photo_user_profile.dart';

class DrawerOptions extends StatelessWidget {
  final List<String> options;
  final VoidCallback onLogout;

  const DrawerOptions({
    super.key,
    required this.options,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        PhotoUserProfile(
          lblTitle: 'Imagen',
        ),
        gap16,
        Divider(
          color: ComColors.gs500,
          height: 0,
        ),
        ...options.map(
          (option) => Column(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                splashColor: ComColors.act300.withOpacity(0.2),
                highlightColor: ComColors.gs200.withOpacity(0.2),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    option,
                    style: ComTextStyle.body1.gsWhite,
                  ),
                ),
              ),
              Divider(
                color: ComColors.gs500,
                thickness: 0.5,
                height: 1,
              ),
            ],
          ),
        ),
        ExpansionTitleConfig(),
        //  Spacer(),
        Divider(
          color: ComColors.gs500,
          height: 0,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: ComColors.act300.withOpacity(0.2),
          highlightColor: ComColors.gs200.withOpacity(0.2),
          onTap: onLogout,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cerrar sesión',
              style: ComTextStyle.body1.gsWhite,
            ),
          ),
        ),
        Divider(
          color: ComColors.gs500,
          height: 0,
        ),
      ],
    );
  }
}
