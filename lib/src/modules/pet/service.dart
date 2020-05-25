import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';

class PetService {

  static Future<ApiResponse> loadData (String query) async {
    // String _url = 'http://localhost:3000/api/pet/?$query';
    String _heroku = 'https://pet-son-back.herokuapp.com/api/pet/?$query';
    ApiResponse apiResponse;

    apiResponse = await ApiResponse.loadData(_heroku);
    /*try {
      apiResponse = await ApiResponse.loadData(_heroku);
    } catch (ex) {
      print('exc');
      print(ex.toString());
    }*/
    return apiResponse;
  }
}
