import 'package:appnation_casestudy/data/datasoruces/dog_service.dart';
import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/domain/models/errors.dart';
import 'package:appnation_casestudy/domain/repositories/dog_repo_abstract.dart';
import 'package:either_dart/either.dart';

class DogRepo extends IDogRepo {
  final DogService dogService = DogService();

  // @override
  // Future<Either<CustomError, String>> generateRandomImage(String breed) async {
  //   return await dogService.generateRandomImage(breed);
  // }

  @override
  Future<String> generateRandomImage(String breed) async {
    return await dogService.generateRandomImage(breed);
  }

  // @override
  // Future<Either<CustomError, List<DogModel>>> getAllBreeds() async {
  //   Either<CustomError, List<DogModel>> result = await dogService.getAllBreeds().fold((left) => Left(left), (right) async {
  //     Map<String, dynamic> rawData = await dogService.getAllBreeds();
  //     List<String> breeds = rawData.keys.toList();
  //     //Paralel olarak resimler çekiliyor
  //     final List<String> responses = await Future.wait(List.generate(breeds.length, (index) => dogService.generateRandomImage(breeds[index])));
  //     //Data modeli oluşturuluyor
  //     List<DogModel> dogs = List.generate(breeds.length, (index) => DogModel(breed: breeds[index], subreeds: rawData[breeds[index]], img: responses[index]));

  //     return Right(dogs);
  //   });

  //   return result;
  // }

  @override
  Future<List<DogModel>> getAllBreeds() async {
    Map<String, List<String>> rawData = await dogService.getAllBreeds();
    List<String> breeds = rawData.keys.toList();
    //Paralel olarak resimler çekiliyor
    final List responses = await Future.wait(List.generate(breeds.length, (index) => dogService.generateRandomImage(breeds[index])));
    //Data modeli oluşturuluyor
    List<DogModel> dogs =
        List.generate(breeds.length, (index) => DogModel(breed: breeds[index], subreeds: rawData[breeds[index]] as List<String>, img: responses[index]));

    return dogs;
  }
}
