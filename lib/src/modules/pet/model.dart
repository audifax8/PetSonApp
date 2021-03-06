import 'package:pet_son_app/src/modules/shared/api-response.dart';

class Pet {
  String id;
  String avatar;
  String description;
  String name;
  String gender;
  String creationDate;
  String editionDate;
  String deletionDate;
  bool active;
  bool adopted;
  String adoptionComment;
  String adoptionPicture;

  Pet() {
    id = '';
    avatar = 'avatar';
    description = 'description';
    name = 'name';
    adoptionComment = '';
    adoptionPicture = '';
  }

  static List<Pet> mapFromApiResponse(ApiResponse apiResponse) {
    return apiResponse.data.map((data) =>
      Pet.fromJson(data)
    ).toList();
  }

  Pet.fromJson(Map<String, dynamic> jsonData) :
    id = jsonData['id'],
    avatar = jsonData['avatar'],
    description = jsonData['description'],
    adoptionComment = jsonData['adoptionComment'],
    adoptionPicture = jsonData['adoptionPicture'],
    name = jsonData['name'],
    active = jsonData['active'] as bool,
    adopted = jsonData['adopted'] as bool;

}
