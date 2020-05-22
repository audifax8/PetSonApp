import 'package:flutter/material.dart';

import './app_config.dart';
import './src/app.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'PetSon',
    flavorName: 'development',
    apiBaseUrl: 'http://localhost:3000/api/',
    child: new PetSonApp(),
  );

  runApp(configuredApp);
}