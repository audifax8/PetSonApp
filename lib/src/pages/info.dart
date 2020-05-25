import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:getflutter/getflutter.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Información'),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getInfo(),
          ]
        )
      ),
    );
  }
  Widget _getInfo() {
    return Column(
      children: <Widget>[
        GFListTile(
          titleText:'Title',
          subtitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
          icon: Icon(Icons.favorite)
        ),
        Card(
          child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
              width: 300,
              height: 100,
              child: Text('Misión'),
            ),
          )
        ),
        Card(
          child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: Container(
              width: 300,
              height: 100,
              child: Text('Visión'),
            ),
          )
        )
      ],
    );
  }
}
