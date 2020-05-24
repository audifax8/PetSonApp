import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:pet_son_app/src/modules/pet/model.dart';

Widget drawPetAdopted(Pet pet) {
  return GFCard(
    boxFit: BoxFit.cover,
    image: Image.network(pet.adoptionPicture),
    title: GFListTile(
      avatar:GFAvatar(
        backgroundImage: NetworkImage(pet.avatar),
      ),
      title: Text(pet.name),
     ),
     content: Column(
       children: <Widget>[
         Center(child: Text('Testimonio de Adopción:', style: TextStyle(fontSize: 20)),),
         Text(pet.adoptionComment),
       ],
     )
   );
}
