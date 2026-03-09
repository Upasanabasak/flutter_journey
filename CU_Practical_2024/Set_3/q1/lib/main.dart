/* 
Develop a Flutter app using Dart programming that allows users to convert 
temperatures between Fahrenheit to Celsius. The app should include an input 
field for the temperature value, drop-down menus to select the input & output 
and a Submit button to perform the conversion. 
*/

import 'package:flutter/material.dart';

void main() => runApp(const TempConverterApp());

class TempConverterApp extends StatelessWidget {
  const TempConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: const TempConverterHome(),
    );
  }
}

class TempConverterHome extends StatefulWidget {
  const TempConverterHome({super.key});

  @override
  State<TempConverterHome> createState() => _TempConverterHomeState();
}

class _TempConverterHomeState extends State<TempConverterHome> {
  final _tempController = TextEditingController();
  String _inputUnit = 'Fahrenheit';
  String _outputUnit = 'Celsius';
  String _result = "";

  void _convertTemperature() {
    double inputVal = double.tryParse(_tempController.text) ?? 0;
    double outputVal;

    setState(() {
      if (_inputUnit == _outputUnit) {
        outputVal = inputVal;
      } else if (_inputUnit == 'Fahrenheit' && _outputUnit == 'Celsius') {
        outputVal = (inputVal - 32) * 5 / 9;
      } else {
        // Celsius to Fahrenheit
        outputVal = (inputVal * 9 / 5) + 32;
      }
      _result = outputVal.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _tempController,
              decoration: const InputDecoration(
                labelText: 'Enter Temperature',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDropdown(
                  'From',
                  _inputUnit,
                  (val) => setState(() => _inputUnit = val!),
                ),
                const Icon(Icons.arrow_forward),
                _buildDropdown(
                  'To',
                  _outputUnit,
                  (val) => setState(() => _outputUnit = val!),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _convertTemperature,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Submit'),
            ),
            const SizedBox(height: 40),
            Text(
              _result.isEmpty ? "" : "Result: $_result $_outputUnit",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      children: [
        Text(label),
        DropdownButton<String>(
          value: value,
          items: const [
            DropdownMenuItem(value: 'Fahrenheit', child: Text('Fahrenheit')),
            DropdownMenuItem(value: 'Celsius', child: Text('Celsius')),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
