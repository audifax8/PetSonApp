import 'package:pet_son_app/src/modules/shared/api-response.dart';

class PetType {
  String id;
  String avatar;
  String name;

  PetType() {
    id = '';
    avatar = 'avatar';
    name = 'name';
  }

  static List<PetType> mapFromApiResponse(ApiResponse apiResponse) {
    return apiResponse.data.map((data) =>
      PetType.fromJson(data)
    ).toList();
  }

  PetType.fromJson(Map<String, dynamic> jsonData) :
    id = jsonData['id'],
    avatar = jsonData['avatar'],
    name = jsonData['name'];

}
