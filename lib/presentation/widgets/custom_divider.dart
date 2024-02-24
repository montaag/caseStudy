import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Palette.grey,
      indent: 20,
      endIndent: 20,
      thickness: 3,
      height: 0,
    );
  }
}
