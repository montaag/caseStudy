part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends SplashEvent {
  final List<Image> cachedImage;

  InitializeApp({required this.cachedImage});
}
