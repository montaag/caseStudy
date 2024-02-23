part of 'dog_bloc.dart';

sealed class DogState extends Equatable {
  final List<DogModel> dogList;

  const DogState({required this.dogList});

  @override
  List<Object> get props => [dogList];
}

final class DogInitial extends DogState {
  DogInitial() : super(dogList: []);
}

final class DataLoaded extends DogState {
  final String? generatedImage;

  const DataLoaded({required super.dogList, this.generatedImage});
  @override
  List<Object> get props => [generatedImage ?? ""];
}

final class Loading extends DogState {
  const Loading({required super.dogList});
}

final class SplashLoading extends DogState {
  SplashLoading() : super(dogList: []);
}

class Failure extends DogState {
  final CustomException error;
  const Failure({
    required super.dogList,
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
