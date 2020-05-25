import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/menu.dart';
import '../components/menu_icon.dart';

class Info extends StatelessWidget {

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuIcon(),

        title: Text('Información'),
      ),
      drawer: Menu(),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getInfo(),
            GFListTile(
              titleText:'Jornadas de Adopción',
              subtitleText:'Vista previa de nuestras últimas jornadas de adopción',
              // icon: Icon(Icons.favorite)
            ),
            _drawCarousel(),
          ]
        )
      );
  }

  Widget _getInfo() {
    return GFCard(
      boxFit: BoxFit.cover,
      // imageOverlay: AssetImage('your asset image'),
      title: GFListTile(
        avatar: Icon(Icons.favorite),
        title: Text('PetSon'),
        subTitle: Text('¿Qué pretende esta App?'),
      ),
      content: Text("Queremos ayudarte a encontrar tu mascoja, o como nosotros lo llamamos, tu futuro hijo."),
      /*buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () => _launchURL,
            text: 'View',
          )
        ],
      ),*/
    );
  }

  Widget _drawCarousel() {
    return GFCarousel(
      items: imageList.map(
      (url) {
      return Container(
        margin: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              url,
              fit: BoxFit.cover,
                width: 1000.0
            ),
          ),
        );
        },
      ).toList(),
      onPageChanged: (index) {
        /*setState(() {
          index;
        });*/
      },
    );
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

/**
 *

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


 *
 */