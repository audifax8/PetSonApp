import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_son_app/src/modules/pet/model.dart';

Widget drawPetPending(Pet pet) {
  return GFCard(
    boxFit: BoxFit.cover,
    image: Image.network(pet.avatar),
    title: GFListTile(
        title: Center(child: Text(pet.name, style: TextStyle(fontSize: 30))),
    ),
    content: Text(pet.description),
    buttonBar: GFButtonBar(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        GFIconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.whatsapp),
          color: Colors.green,
        ),
     ],
   ),
 );
}
