/* 
Develop a Flutter app using Dart programming to calculate the 
area and circumference of a circle based on the input radius. 
The app should provide a dropdown list for users to select either 
the area or circumference calculation. Ensure that the app displays 
the calculated result.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const CalculationApp());
}

class CalculationApp extends StatelessWidget {
  const CalculationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController _radiousController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: _radiousController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter radious value',
                prefixIcon: IconButton(onPressed: () {},
                icon: Icon(Icons.numbers),
                ),
                prefixIconColor: Colors.orangeAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    
                  ),
                  ),
              ],
            ),
          ],
        ),
        ),
    );
  }
}