import 'package:flutter/material.dart';

import 'imports.dart';

mixin CustomTheme {
  static ThemeData lightTheme(context) => ThemeData(
        fontFamily: "Galano Grotesque",
        textTheme: const TextTheme().apply(
          bodyColor: Palette.lightGray,
          displayColor: Palette.primaryTextColor,
        ),
        scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
        primaryColor: Palette.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: CustomTextStyle.title(context, color: Palette.primaryTextColor),
          color: Palette.scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
        ),
      );
}
