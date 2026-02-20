import 'package:flutter/material.dart';
import 'package:question_4/screens/home/home_screen.dart';

void main() {
  runApp(const Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen2(),
    );
  }
}