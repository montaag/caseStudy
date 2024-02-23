import 'dart:async';
import 'dart:developer';

import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/presentation/bloc/bloc/dog_bloc.dart';
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

  Future caching(BuildContext context) async {
    List<Future> futures = [];

    for (var element in cachedImages) {
      futures.add(precacheImage(element.image, context));
    }
    log(futures.length.toString());
    await Future.wait(futures);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DogBloc>().add(FetchData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DogBloc, DogState>(
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
        }
      },
      child: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          return state is SplashLoading
              ? Scaffold(
                  body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: Image.asset("assets/icons/splash.png"))],
                ))
              : FutureBuilder(
                  future: caching(context),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done) {
                      //  Navigator.pushReplacementNamed(context, "/", arguments: cachedImages);
                      return Dashboard(cachedImages: cachedImages);
                    } else {
                      return Scaffold(
                          body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Center(child: Image.asset("assets/icons/splash.png"))],
                      ));
                    }
                  });
        },
      ),
    );
  }
}
