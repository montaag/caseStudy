import 'dart:async';
import 'dart:developer';

import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
import 'package:appnation_casestudy/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:appnation_casestudy/presentation/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Image> cachedImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DogBloc>().add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DogBloc, DogState>(
          listener: (context, state) {
            if (state is DataLoaded) {
              setState(() {
                cachedImages = List<Image>.generate(
                  state.dogList.length,
                  (index) => Image.network(
                    state.dogList[index].img,
                    fit: BoxFit.cover,
                  ),
                );
              });

              context.read<SplashBloc>().add(InitializeApp(cachedImage: cachedImages));
            }
          },
        ),
        BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is AppLoaded) {
              Navigator.pushReplacementNamed(context, "home", arguments: cachedImages);
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Image.asset("assets/icons/splash.png"))],
        ),
      ),
    );
  }
}
