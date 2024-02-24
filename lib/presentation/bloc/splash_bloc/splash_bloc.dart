import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  BuildContext context;
  SplashBloc(this.context) : super(SplashInitial()) {
    on<InitializeApp>((event, emit) async {
      List<Image> cachedImage = List.from(event.cachedImage);
      List<Future> futures = [];

      for (var element in cachedImage) {
        futures.add(precacheImage(element.image, context));
      }
      await Future.wait(futures);

      emit(AppLoaded());
    });
  }
}
