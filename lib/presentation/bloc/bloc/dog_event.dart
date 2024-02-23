part of 'dog_bloc.dart';

sealed class DogEvent extends Equatable {
  const DogEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends DogEvent {}

class GenerateImage extends DogEvent {
  final String breed;

  const GenerateImage({required this.breed});
}
