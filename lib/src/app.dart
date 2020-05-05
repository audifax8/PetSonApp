import 'package:flutter/material.dart';
import './pages/welcome.dart';

class PetSonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Welcome()
      )
    );
  }
}