import 'package:flutter/material.dart';

import 'package:proyecto_torneos/core/style/style.dart';
import 'package:proyecto_torneos/presentation/end_drawer_add/end_drawer_add.dart';
import 'package:proyecto_torneos/presentation/result_table/result_table_screen.dart';
import 'package:proyecto_torneos/presentation/home/widgets/torenos.dart';

import '../../core/core.dart';
import '../drawer_header_options/drawer_menu_header.dart';
import '../register_statistic/volleyball_matches_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenuHeader(),
      appBar: AppBar(
        backgroundColor: ComColors.succ500,
        title: Center(
          child: Text(
            'Incio',
            style: ComTextStyle.h6.gsWhite,
          ),
        ),
        actions: [
          CustomPopupMenu(
            onOptionSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VolleyballMatchesScreen(),
                  ),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultTableScreen(),
                  ),
                );
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
            Text('Torneos', style: ComTextStyle.h6),
            gap16,
            Expanded(child: Torneos()),
          ],
        ),
      ),
    );
  }
}
