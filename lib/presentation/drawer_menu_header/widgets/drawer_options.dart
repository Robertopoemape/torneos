import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../src/models/models.dart';
import 'expansion_title_config.dart';
import 'photo_user_profile.dart';

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({
    super.key,
    required this.options,
    required this.onLogout,
    required this.playerPhotoUrl,
    required this.name,
  });
  final List<MenuItems> options;
  final VoidCallback onLogout;
  final String playerPhotoUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        PhotoUserProfile(
          lblTitle: name,
          playerPhotoUrl: playerPhotoUrl,
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
                onTap: option.onOptionSelected,
                borderRadius: BorderRadius.circular(8),
                splashColor: ComColors.act300.withOpacity(0.2),
                highlightColor: ComColors.gs200.withOpacity(0.2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: ds15, horizontal: ds8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    option.title,
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
