import 'package:flutter/material.dart';

import './pages/info.dart';
import './pages/team-member-page.dart';
import './pages/pet.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (BuildContext context) => Info(),
    'info': (BuildContext context) => Info(),
    'lastAdoptions': (BuildContext context) => PetPage(adopted: true),
    'petsPending': (BuildContext context) => PetPage(adopted: false),
    'team': (BuildContext context) => TeamMemberPage(),
  };
}
