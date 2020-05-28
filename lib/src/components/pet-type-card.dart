import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:pet_son_app/src/modules/pet-type/model.dart';

Widget drawPetType(PetType petType, String petTypeSelected) {
  return ListTile(
    title: Text(
      petType.name
    ),
    leading: GFAvatar(
      backgroundImage: NetworkImage(petType.avatar),
    ),
    onTap: () => petTypeSelected = petType.id,
  );
}
