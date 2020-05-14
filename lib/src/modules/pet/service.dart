import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';
import 'package:pet_son_app/src/modules/pet/model.dart';

class PetService {

  static Future<List<Pet>> loadData (String query) async {
    String _url = 'http://localhost:3000/api/pet/?$query';
    String _heroku = 'https://pet-son-back.herokuapp.com/api/pet/?$query';
    ApiResponse apiResponse;

    try {
      print(_url);
      apiResponse = await ApiResponse.loadData(_url);
      print(apiResponse);
    } catch (ex) {
      print(ex.toString());
    }

    return Pet.mapFromApiResponse(apiResponse);
  }
}