import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_son_app/src/modules/team/model.dart';

class TeamMemberService {

  static Future<List<TeamMember>> loadData () async {
    // String _url = 'http://localhost:3000/api/team-member/';
    String _heroku = 'https://pet-son-back.herokuapp.com/api/team-member/';
    await Future.delayed(Duration(seconds: 2));
    http.Response response = await http.get(_heroku);
    String _content = response.body;
    var _res = json.decode(_content);
    List<TeamMember> _teamMembers = [];
    try {
      _res['data'].map((data) {
        TeamMember tm = TeamMember.fromJson(data);
        _teamMembers.add(tm);
      }).toList();
    } catch (ex) {
      print(ex.toString());
    }
    return _teamMembers;
  }

}