/* 
Develop a Flutter app using Dart programming to calculate the volume of a cube and a cylinder. 
The app should provide text boxes for side, radius and a dropdown to select height of a cylinder. 
Display the volumes in the same page. Use buttons when pressed will calculate the volume and a 
clear button which will clear the content. 
*/

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const VolumeCalculatorApp());

class VolumeCalculatorApp extends StatelessWidget {
  const VolumeCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const VolumeHome(),
    );
  }
}

class VolumeHome extends StatefulWidget {
  const VolumeHome({super.key});

  @override
  State<VolumeHome> createState() => _VolumeHomeState();
}

class _VolumeHomeState extends State<VolumeHome> {
  // Controllers for text inputs
  final _sideController = TextEditingController();
  final _radiusController = TextEditingController();

  // State variables
  double? _selectedHeight;
  String _cubeResult = "0.00";
  String _cylinderResult = "0.00";

  // Dropdown values (Height from 1 to 20)
  final List<double> _heightOptions = List.generate(
    20,
    (index) => (index + 1).toDouble(),
  );

  void _calculateVolumes() {
    setState(() {
      // Cube Calculation
      double side = double.tryParse(_sideController.text) ?? 0;
      _cubeResult = (pow(side, 3)).toStringAsFixed(2);

      // Cylinder Calculation
      double radius = double.tryParse(_radiusController.text) ?? 0;
      if (_selectedHeight != null) {
        _cylinderResult = (pi * pow(radius, 2) * _selectedHeight!)
            .toStringAsFixed(2);
      } else {
        _cylinderResult = "Select Height";
      }
    });
  }

  void _clearAll() {
    setState(() {
      _sideController.clear();
      _radiusController.clear();
      _selectedHeight = null;
      _cubeResult = "0.00";
      _cylinderResult = "0.00";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shape Volume Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cube Section
            const Text(
              "Cube",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _sideController,
              decoration: const InputDecoration(
                labelText: "Enter Side Length",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Cylinder Section
            const Text(
              "Cylinder",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _radiusController,
              decoration: const InputDecoration(
                labelText: "Enter Radius",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<double>(
              value: _selectedHeight,
              decoration: const InputDecoration(
                labelText: "Select Height",
                border: OutlineInputBorder(),
              ),
              items: _heightOptions
                  .map(
                    (h) =>
                        DropdownMenuItem(value: h, child: Text(h.toString())),
                  )
                  .toList(),
              onChanged: (val) => setState(() => _selectedHeight = val),
            ),
            const SizedBox(height: 30),

            // Display Results
            Card(
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Cube Volume: $_cubeResult",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Divider(),
                    Text(
                      "Cylinder Volume: $_cylinderResult",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculateVolumes,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Calculate"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearAll,
                    child: const Text("Clear"),
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
