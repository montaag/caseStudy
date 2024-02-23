import 'package:appnation_casestudy/config/router/routes.dart';
import 'package:appnation_casestudy/config/themes/imports.dart';
import 'package:appnation_casestudy/data/repositories/dog_repo.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
import 'package:appnation_casestudy/presentation/view/homePage.dart';
import 'package:appnation_casestudy/presentation/view/settings.dart';
import 'package:appnation_casestudy/presentation/view/splashScreen.dart';
import 'package:appnation_casestudy/simple_bloc_pbserver.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogBloc(
        repo: DogRepo(),
      ),
      child: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          return Sizer(
            builder: (BuildContext context, Orientation orientation, DeviceType deviceType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'AppNation-SelinBaykal',
              theme: CustomTheme.lightTheme(context),
              home: SplashScreen(),
              onGenerateRoute: CustomRouter.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
