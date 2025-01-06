import 'package:flutter/material.dart';

import '../style/style.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ComColors.pri500, // Fondo claro
  textTheme: TextTheme(
    bodyLarge: ComTextStyle.body2.sec800,
    bodyMedium: ComTextStyle.body1.sec800,
    displayLarge: ComTextStyle.displayXL.sec800,
    displayMedium: ComTextStyle.displayM.sec800,
    displaySmall: ComTextStyle.displayS.sec800,
    headlineLarge: ComTextStyle.h1.sec800,
    headlineMedium: ComTextStyle.h2.sec800,
    headlineSmall: ComTextStyle.h3.sec800,
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: ComColors.acce500)
      .copyWith(surface: ComColors.light),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ComColors.sec600, // Color principal
  hintColor: ComColors.acce600, // Fondo oscuro
  textTheme: TextTheme(
    bodyLarge: ComTextStyle.body2.gsWhite,
    bodyMedium: ComTextStyle.body1.gsWhite,
    displayLarge: ComTextStyle.displayXL.gsWhite,
    displayMedium: ComTextStyle.displayM.gsWhite,
    displaySmall: ComTextStyle.displayS.gsWhite,
    headlineLarge: ComTextStyle.h1.gsWhite,
    headlineMedium: ComTextStyle.h2.gsWhite,
    headlineSmall: ComTextStyle.h3.gsWhite,
  ),
);

ThemeData themeOf(BuildContext context) {
  return Theme.of(context);
}
