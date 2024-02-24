import 'dart:convert';

import 'package:appnation_casestudy/domain/models/errors.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class DogService {
  Future<Either<CustomError, Map<String, List<String>>>> getAllBreeds() async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        Map<String, List<String>> result = {for (var item in data["message"].keys) item: List<String>.from(data["message"][item])};
        return Right(result);
      } else {
        return Left(CustomError(error: "Hata Oluştu", code: response.statusCode));
      }
    } catch (e) {
      return Left(CustomError(error: e.toString(), code: 0));
    }
  }

  Future<Either<CustomError, String>> generateRandomImage(String breed) async {
    //Bu fonksiyon verilen tür için rastgele fotoğraf üretir.
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return Right(data["message"]);
      } else {
        return Left(CustomError(error: "Hata Oluştu", code: response.statusCode));
      }
    } catch (e) {
      return Left(CustomError(error: e.toString(), code: 0));
    }
  }
}
