import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class DogService {
  Future<Map<String, List<String>>> getAllBreeds() async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // return Right(data["message"]);
        //   List<String> values = List<String>.from(data["message"].values);
        Map<String, List<String>> result = {for (var item in data["message"].keys) item: List<String>.from(data["message"][item])};
        return result;
      } else {
        //   return Left(CustomError(error: "Hata Oluştu", code: response.statusCode));
        return {};
      }
    } catch (e) {
      //   return Left(CustomError(error: e.toString(), code: 0));
      log(e.toString());
      return {};
    }
  }

  Future<String> generateRandomImage(String breed) async {
    //Bu fonksiyon verilen tür için rastgele fotoğraf üretir.
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        //  return Right(data["message"]);
        return data["message"];
      } else {
        //return Left(CustomError(error: "Hata Oluştu", code: response.statusCode));

        return "";
      }
    } catch (e) {
      // return Left(CustomError(error: e.toString(), code: 0));
      return "";
    }
  }
}
