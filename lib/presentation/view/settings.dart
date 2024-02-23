import 'dart:convert';

import 'package:appnation_casestudy/presentation/widgets/settings_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String os = "";

  var platform = const MethodChannel('channel');

  Future<String> getOsVersion() async {
    try {
      final String result = await platform.invokeMethod('getOsVersion');
      return result;
    } on PlatformException catch (e) {
      return 'Failed to get OS version: ${e.message}';
    }
  }

  @override
  void initState() {
    super.initState();

    getOsVersion().then((device) {
      setState(() {
        os = device;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<SettingItem> items = [
      SettingItem(asset: "help", title: "Help"),
      SettingItem(asset: "star", title: "Rate Us"),
      SettingItem(asset: "share", title: "Share with Friends"),
      SettingItem(asset: "terms", title: "Terms of Use"),
      SettingItem(asset: "privacy", title: "Privacy Policy"),
      SettingItem(asset: "version", title: "OS Version", OS: os),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F7),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: items.map((e) => SettingsTile(item: e)).toList(),
          ),
        ),
      ),
    );
  }
}
