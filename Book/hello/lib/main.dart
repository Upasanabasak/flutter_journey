import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Flutter App'),
        ),
        body: Center(
          child: Text(
            'HelloWorld!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
