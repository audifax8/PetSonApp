import 'package:flutter/material.dart';

class Menu extends StatelessWidget {

/*Map<String, Object> _routesMap = {
  'info': {
    'text': 'Información',
    'icon': ''
  },
  'lastAdoptions': {
    'text': 'Últimas adopciones',
    'icon': ''
  },
  'petsPending': {
    'text': 'Mascotas en adopción',
    'icon': ''
  },
  'team': {
    'text': 'Equipo',
    'icon': ''
  }
};*/

  final Map<String, Object> _routesMap = {
    'info': 'Información',
    'lastAdoptions': 'Últimas adopciones',
    'petsPending': 'Mascotas en adopción',
    'team': 'Equipo',
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: _getMenuItems(context),
      )
    );
  }

  List<Widget> _getMenuItems(BuildContext context) {
    List<Widget> menuOptions = [];
    this._routesMap.forEach((route, name) {
      ListTile menuOption = new ListTile(
        title: Text(name),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
      menuOptions.add(menuOption);
    });

    return menuOptions;
  }
}