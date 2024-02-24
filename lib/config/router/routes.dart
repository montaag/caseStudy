import 'package:appnation_casestudy/presentation/view/dashboard.dart';
import 'package:appnation_casestudy/presentation/view/splashScreen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "home":
        return MaterialPageRoute(
            builder: (_) => Dashboard(
                  cachedImages: settings.arguments as List<Image>,
                ));
      case "splash":
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}
