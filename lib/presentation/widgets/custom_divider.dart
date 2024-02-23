import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFE5E5EA),
      indent: 20,
      endIndent: 20,
      thickness: 3,
      height: 0,
    );
  }
}
