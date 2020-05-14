import 'dart:async';
import 'package:pet_son_app/src/modules/shared/api-response.dart';
import 'package:pet_son_app/src/modules/team-member/model.dart';

class TeamMemberService {

  static Future<List<TeamMember>> loadData () async {
    String _url = 'http://localhost:3000/api/team-member/';
    String _heroku = 'https://pet-son-back.herokuapp.com/api/team-member/';
    ApiResponse apiResponse;

    try {
      apiResponse = await ApiResponse.loadData(_url);
    } catch (ex) {
      print(ex.toString());
    }

    return TeamMember.mapFromApiResponse(apiResponse);
  }
}