import 'package:flutter/material.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text('Equipo PetSon'),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Equipo", style: TextStyle(fontSize: 40)),
          ]
        )
      ),
    );
  }
}
