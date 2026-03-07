/*
Develop a Flutter app using Dart programming that converts 
Indian currency (INR) to US Currency (USD) based on user defined 
exchange rates (87 INR = 1USD). The app should include input fields 
for users to enter the amount, drop-down menus to select the input 
and output currencies, and a button to perform the conversion. 
Ensure that the app displays the converted amount
*/

import 'package:flutter/material.dart';

void main () {
  runApp(const CurrencyApp());
}

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final TextEditingController _currencyController = TextEditingController();
  final List<String> _units = ['Indian currency (INR)', 'US Currency (USD)'];
  String _fromUnit = 'Indian currency (INR)';
  String _toUnit = 'US Currency (USD)';
  String _result = '';

  void conversion () {
    double input = double.tryParse(_currencyController.text) ?? 0.0;
    double total = 0.0;

    setState(() {
      if(_fromUnit == _toUnit)
      {
        _result = "Please select different curriences.";
      }
      else if(_fromUnit == 'Indian currency (INR)' && _toUnit == 'US Currency (USD)')
      {
        total = input / 87;
        _result = "Result: ${total.toStringAsFixed(2)} USD";
      } 
      else
      {
        total = input * 87;
        _result = "Result: ${total.toStringAsFixed(2)} IND";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Change'),
        backgroundColor: Colors.lime,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
          fontStyle: FontStyle.italic,
          color: const Color.fromARGB(255, 255, 101, 59),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _currencyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                )
              ),
            ),
            SizedBox(height: 10,),
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
                        })
                    ],
                  )
                  ),
                  SizedBox(height: 200,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('To Unit'),
                        DropdownButton<String>(
                          value: _toUnit,
                          isExpanded: true,
                          items: _units.map((String unit) {
                            return DropdownMenuItem(
                              value: unit,
                              child: Text(unit));
                          }).toList(), 
                          onChanged: (String? newValue) {
                            setState(() {
                              _toUnit = newValue!;
                            });
                          })
                      ],
                    )
                    )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: conversion, child: Text('Convert'))
              ],
            ),
            SizedBox(height: 15,),
            Text(
              _result,
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 30,
                fontStyle: FontStyle.italic
              ),
            )
          ],
        ),
      ),
    );
  }
}