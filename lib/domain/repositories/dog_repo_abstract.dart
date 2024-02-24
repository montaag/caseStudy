import 'package:appnation_casestudy/domain/models/dog_model.dart';
import 'package:appnation_casestudy/domain/models/errors.dart';
import 'package:either_dart/either.dart';

abstract class IDogRepo {
  Future<Either<CustomError, List<DogModel>>> getAllBreeds();
  Future<Either<CustomError, String>> generateRandomImage(String breed);

  // Future<List<DogModel>> getAllBreeds();
  // Future<String> generateRandomImage(String breed);
}
