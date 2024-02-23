import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:flutter/material.dart';

mixin CustomTextStyle {
  static TextStyle baseStyle(
    TextStyle style, {
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
    Color? color,
    double? fontSize,
  }) {
    return style.copyWith(
      fontFamily: "Galano-Grotesque",
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      fontSize: fontSize,
    );
  }

  static TextStyle title(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w700,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? decoration,
    Color? color,
  }) {
    return baseStyle(
      Theme.of(context).textTheme.titleMedium!,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color ?? Palette.primaryColor,
      decoration: decoration,
      fontSize: 20,
    );
  }

  static TextStyle body(
    BuildContext context, {
    FontWeight fontWeight = FontWeight.w500,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? decoration,
    Color? color,
  }) {
    return baseStyle(
      Theme.of(context).textTheme.bodyMedium!,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color ?? Palette.primaryTextColor,
      decoration: decoration,
      fontSize: 16,
    );
  }
}
