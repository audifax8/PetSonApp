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

  TeamMember.fromJson(Map<String, dynamic> jsonData) :
    id = jsonData['id'],
    avatar = jsonData['avatar'],
    description = jsonData['description'],
    name = jsonData['name'];


}
/*
"avatar": "https://storage.needpix.com/rsynced_images/blank-profile-picture-973461_1280.png",
            "description": "dexcrp1",
            "name": "User1",
            "occupation": "oucp1",
            "role": "role1",
            "gender": "gender1",
            "id": "b9d6174d-999e-483d-95f3-032675031c33",
            "creationDate": "2020-05-09T21:11:39.406Z",
            "active"*/