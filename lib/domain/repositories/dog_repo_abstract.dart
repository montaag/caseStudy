import 'package:appnation_casestudy/domain/models/dog_model.dart';

abstract class IDogRepo {
  // Future<Either<CustomError, List<DogModel>>> getAllBreeds();
  // Future<Either<CustomError, String>> generateRandomImage(String breed);

  Future<List<DogModel>> getAllBreeds();
  Future<String> generateRandomImage(String breed);
}
