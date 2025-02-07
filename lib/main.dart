import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_torneos/core/core.dart';
import 'package:proyecto_torneos/firebase_options.dart';

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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        splashColor: ComColors.blue500.withOpacity(0.2),
        highlightColor: Colors.transparent,
        // primarySwatch: Colors.blue,
        primaryColor: ComColors.blue500,
        scaffoldBackgroundColor: ComColors.white, // Camb
      ),
    );
  }
}
