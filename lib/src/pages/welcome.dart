import 'package:flutter/material.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';
import '../components/card_with_image.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),
        title: Text(''),
      ),
      drawer: Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Click's count", style: TextStyle(fontSize: 40)),
            Text('',  style: TextStyle(fontSize: 30)),
            CardWithImage(),
          ]
        )
      ),
    );
  }
}
