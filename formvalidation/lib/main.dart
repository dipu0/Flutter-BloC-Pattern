import 'package:flutter/material.dart';
import 'package:formvalidation/welcome/WelcomeScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "BloC", home: welcomeScreen());
  }
}
