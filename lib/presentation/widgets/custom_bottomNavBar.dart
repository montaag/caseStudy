import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:appnation_casestudy/presentation/view/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrapezoidWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: CustomPaint(
        painter: TrapezoidPainter(),
        child: Container(
            height: kBottomNavigationBarHeight * 1.8,
            // You can place your content inside the container if needed
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/HouseLine.png"),
                      Text(
                        "Home",
                        style: CustomTextStyle.body(context, color: Palette.primaryColor),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  width: 2,
                  color: Color(0xFFD1D1D6),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        enableDrag: true,
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: false,
                        builder: (context) => SettingsView(),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/Vector.png"),
                        Text(
                          "Settings",
                          style: CustomTextStyle.body(context),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class TrapezoidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Palette.bottomNavbarColor
      ..style = PaintingStyle.fill;

    final double topWidth = size.width * 0.96;
    final double bottomWidth = size.width;

    final Path path = Path()
      ..moveTo(0.0, size.height * 2) // bottom-left
      ..lineTo(bottomWidth, size.height * 2) // bottom-right
      ..lineTo(topWidth, 0.0) // top-right
      ..lineTo(size.width * 0.04, 0.0) // top-left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}