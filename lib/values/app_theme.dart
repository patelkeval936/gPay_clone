import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )
    )
  );

  static BoxDecoration boxShadowDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: 2,
        blurRadius: 2,
      ),
    ],
  );

  static BoxDecoration roundedBorderDecoration = const BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
    ),
    color: Colors.white,
  );
}
