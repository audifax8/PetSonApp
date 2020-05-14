import 'package:pet_son_app/src/modules/shared/api-response.dart';

class TeamMember {
  String id;
  String avatar;
  String description;
  String name;
  String occupation;
  String role;
  String gender;
  String creationDate;
  String editionDate;
  String deletionDate;
  bool active;

  TeamMember() {
    id = '';
    avatar = 'avatar';
    description = 'description';
    name = 'name';
  }

  static List<TeamMember> mapFromApiResponse(ApiResponse apiResponse) {
    return apiResponse.data.map((data) =>
      TeamMember.fromJson(data)
    ).toList();
  }

  TeamMember.fromJson(Map<String, dynamic> jsonData) :
    id = jsonData['id'],
    avatar = jsonData['avatar'],
    description = jsonData['description'],
    name = jsonData['name'];

}
