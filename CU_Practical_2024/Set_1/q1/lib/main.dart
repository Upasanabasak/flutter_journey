/*
Develop a Flutter app using Dart programming that allows users to convert temperatures between Celsius and Fahrenheit. 
The app should include an input field for the temperature value, drop-down menus to select the input & output 
and a Submit button to perform the conversion. 
*/
import 'package:flutter/material.dart';
import 'package:q1/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}