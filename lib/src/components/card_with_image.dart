import 'package:flutter/material.dart';

class CardWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://imagenes.heraldo.es/files/og_thumbnail/uploads/imagenes/2014/06/24/_iniesta_b929bd5d.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            // fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('L7'),
          )
        ],
      ),
    );
  }

}