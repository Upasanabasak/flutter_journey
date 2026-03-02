import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tempController = TextEditingController();

  final List<String> _units = ['Celsius', 'Fahrenheit'];

  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  String _result = '';
  String _errorMsg = '';

  void _convertTemp() {
    double? inputTemp = double.tryParse(_tempController.text);

    if (inputTemp == null) {
      setState(() {
        _errorMsg = "Please enter a valid number";
        _result = '';
      });
      return;
    }

    double convertedTemp;

    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      convertedTemp = inputTemp * 9 / 5 + 32;
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      convertedTemp = (inputTemp - 32) * 5 / 9;
    } else {
      convertedTemp = inputTemp;
    }

    setState(() {
      _errorMsg = '';
      _result = "${convertedTemp.toStringAsFixed(2)} $_toUnit";
    });
  }

  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Conversion'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('From Unit'),
                      DropdownButton<String>(
                        value: _fromUnit,
                        isExpanded: true,
                        items: _units.map((String unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _fromUnit = newValue!;
                          });
                        }
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('To Unit'),
                      DropdownButton<String>(
                        value: _toUnit,
                        isExpanded: true,
                        items: _units.map((String unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _toUnit = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _convertTemp,
              child: const Text('Convert'),
            ),

            const SizedBox(height: 20),

            if (_errorMsg.isNotEmpty)
              Text(
                _errorMsg,
                style: const TextStyle(color: Colors.red),
              ),

            if (_result.isNotEmpty)
              Text(
                _result,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}