import 'package:flutter/material.dart';

import './pages/welcome.dart';
import './pages/info.dart';
import './pages/team-member-page.dart';
import './pages/pet.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (BuildContext context) => Welcome(),
    'info': (BuildContext context) => Info(),
    'lastAdoptions': (BuildContext context) => PetPage(true),
    'petsPending': (BuildContext context) => PetPage(false),
    'team': (BuildContext context) => TeamMemberPage(),
  };
}
