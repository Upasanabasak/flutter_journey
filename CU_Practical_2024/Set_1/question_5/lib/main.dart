/*  Develop a Flutter app using Dart programming that has a button and a text widget. 
When the button is pressed, the text widget should display the number of times the button has been pressed. */

import 'package:flutter/material.dart';
import 'package:question_5/screens/home/home_screen.dart';

void main() {
  runApp(const countApp());
}

class countApp extends StatelessWidget {
  const countApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}