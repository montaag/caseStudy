import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  final BoxShape? shape;
  const CustomCloseButton({super.key, this.shape = BoxShape.circle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Palette.scaffoldBackgroundColor, shape: shape!),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              size: 24,
            )),
      ),
    );
  }
}
