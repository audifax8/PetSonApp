import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';

class PetService {

  static Future<ApiResponse> loadData (String url) async {
    ApiResponse apiResponse;
    try {
      apiResponse = await ApiResponse.loadData(url);
    } catch (ex) {
      print(ex.toString());
    }
    return apiResponse;
  }

}
