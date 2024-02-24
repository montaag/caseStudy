import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:appnation_casestudy/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class SettingItem {
  final String asset;
  final String title;
  final String? OS;

  SettingItem({required this.asset, required this.title, this.OS});
}

class SettingsTile extends StatelessWidget {
  final SettingItem item;

  const SettingsTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17),
          child: Row(
            children: [
              Image.asset("assets/icons/${item.asset}.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  item.title,
                  style: CustomTextStyle.body(context),
                ),
              ),
              const Spacer(),
              item.OS == null
                  ? Icon(
                      Icons.call_made,
                      color: Palette.lightGray,
                      size: 18,
                    )
                  : Text(
                      item.OS!,
                      style: CustomTextStyle.body(context, color: Palette.lightGray),
                    )
            ],
          ),
        ),
        const CustomDivider()
      ],
    );
  }
}
