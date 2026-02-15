import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: const Text(
          "Layout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          )
          ),
          body: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          // container
          // Container(width: double.infinity),
          // container 1
          Container(height: 100, width: 100, color: Colors.lime),
          // container 2
          Container(height: 100, width: 100, color: Colors.redAccent),
          // container 3
          Container(height: 100, width: 100, color: Colors.blue),
          ],
          ),
          );
  }
}
