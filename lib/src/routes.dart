import 'package:flutter/material.dart';

import './pages/welcome.dart';
import './pages/info.dart';
import './pages/team.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (BuildContext context) => Welcome(),
    'info': (BuildContext context) => Info(),
    'lastAdoptions': (BuildContext context) => Welcome(),
    'petsPending': (BuildContext context) => Welcome(),
    'team': (BuildContext context) => Team(),
  };
}
