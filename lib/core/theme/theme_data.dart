import 'package:flutter/material.dart';

import '../style/style.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ComColors.greenL500, // Fondo claro
  textTheme: TextTheme(
    bodyLarge: ComTextStyle.body2.black800,
    bodyMedium: ComTextStyle.body1.black800,
    displayLarge: ComTextStyle.displayXL.black800,
    displayMedium: ComTextStyle.displayM.black800,
    displaySmall: ComTextStyle.displayS.black800,
    headlineLarge: ComTextStyle.h1.black800,
    headlineMedium: ComTextStyle.h2.black800,
    headlineSmall: ComTextStyle.h3.black800,
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: ComColors.green500)
      .copyWith(surface: ComColors.light),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ComColors.black600, // Color principal
  hintColor: ComColors.red100, // Fondo oscuro
  textTheme: TextTheme(
    bodyLarge: ComTextStyle.body2.white,
    bodyMedium: ComTextStyle.body1.white,
    displayLarge: ComTextStyle.displayXL.white,
    displayMedium: ComTextStyle.displayM.white,
    displaySmall: ComTextStyle.displayS.white,
    headlineLarge: ComTextStyle.h1.white,
    headlineMedium: ComTextStyle.h2.white,
    headlineSmall: ComTextStyle.h3.white,
  ),
);

ThemeData themeOf(BuildContext context) {
  return Theme.of(context);
}
