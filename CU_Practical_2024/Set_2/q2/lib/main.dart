/* 
Develop a Flutter app using Dart programming to calculate the 
area and circumference of a circle based on the input radius. 
The app should provide a dropdown list for users to select either 
the area or circumference calculation. Ensure that the app displays 
the calculated result.
*/

import 'package:flutter/material.dart';
import 'dart:math'; // Required for the value of PI

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
  final TextEditingController _radiusController = TextEditingController();
  final List<String> _units = ['Area of a circle', 'Circumference of a circle'];

  String show = 'Area of a circle';
  String _result = "0.0"; // Added to store the calculation result

  void _calculate() {
    double? radius = double.tryParse(_radiusController.text);

    if (radius == null || radius <= 0) {
      setState(() {
        _result = "Please enter a valid radius";
      });
      return;
    }

    double calculatedValue;
    if (show == 'Area of a circle') {
      // Formula: π * r^2
      calculatedValue = pi * pow(radius, 2);
    } else {
      // Formula: 2 * π * r
      calculatedValue = 2 * pi * radius;
    }

    setState(() {
      _result = calculatedValue.toStringAsFixed(2); // Round to 2 decimal places
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation'),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        titleTextStyle: const TextStyle(
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
            const SizedBox(height: 10),
            TextField(
              controller: _radiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter radius value',
                prefixIcon: const Icon(Icons.numbers),
                prefixIconColor: Colors.orangeAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Option',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      DropdownButton<String>(
                        value: show,
                        isExpanded: true,
                        items: _units.map((String unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            show = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Added Calculate Button
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            // Added Result Display
            const Text(
              "Result:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
