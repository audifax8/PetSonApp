import 'package:flutter/material.dart';

import './app_config.dart';
import './src/app.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'PetSon',
    flavorName: 'production',
    apiBaseUrl: 'https://pet-son-back.herokuapp.com/api/',
    child: new PetSonApp(),
  );

  runApp(configuredApp);
}