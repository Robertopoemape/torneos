import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_torneos/firebase_options.dart';

import 'core/router/router_provider_micro.dart';

final appRouter = MicroAppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
