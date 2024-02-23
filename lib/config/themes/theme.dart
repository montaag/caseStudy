import 'package:flutter/material.dart';

import 'imports.dart';

mixin CustomTheme {
  static ThemeData lightTheme(context) => ThemeData(
        fontFamily: "Galano Grotesque",
        textTheme: const TextTheme().apply(
          bodyColor: Palette.hintTextColor,
          displayColor: Palette.primaryTextColor,
        ),
        scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
        primaryColor: Palette.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.primaryColor,
          unselectedItemColor: Palette.unselectedLabelColor,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: CustomTextStyle.title(context, color: Palette.primaryTextColor),
          color: Palette.scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
      );
}
