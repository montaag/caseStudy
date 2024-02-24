import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No results found",
          style: CustomTextStyle.title(context, color: Palette.primaryTextColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Try searching with another word",
          style: CustomTextStyle.body(context, color: Palette.hintTextColor),
        ),
      ],
    );
  }
}
