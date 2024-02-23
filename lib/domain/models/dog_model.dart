// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class DogModel extends Equatable {
  final String breed;
  final List<String> subreeds;
  final String img;
  const DogModel({
    required this.breed,
    required this.subreeds,
    required this.img,
  });

  @override
  String toString() => 'DogModel(breed: $breed, subreeds: $subreeds)';

  @override
  List<Object?> get props => [breed, subreeds, img];
}
