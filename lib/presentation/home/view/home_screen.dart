import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/router/router_provider_micro.gr.dart';

import '../../drawer_menu_header/drawer_menu_header.dart';
import '../widgets/widgets.dart';

@RoutePage()
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
      drawer: DrawerMenuHeaderScreen(),
      appBar: AppBar(
        backgroundColor: ComColors.succ500,
        centerTitle: true,
        title: Text(
          'Incio',
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
            Text('Torneos', style: ComTextStyle.h6),
            gap16,
            Expanded(child: Torneos()),
          ],
        ),
      ),
    );
  }
}
