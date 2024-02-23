import 'package:flutter/material.dart';

import '../../config/themes/imports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      color: Palette.primaryColor,
      elevation: 0,
      child: MaterialButton(
        minWidth: double.maxFinite,
        onPressed: onPressed,
        child: Text(title, style: CustomTextStyle.body(context, color: Colors.white)),
      ),
    );
  }
}
