import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';

class TeamMemberService {

  static Future<ApiResponse> loadData () async {
    // String _url = 'http://localhost:3000/api/team-member/';
    String _heroku = 'https://pet-son-back.herokuapp.com/api/team-member/';
    ApiResponse apiResponse = await ApiResponse.loadData(_heroku);
    return apiResponse;
  }
}