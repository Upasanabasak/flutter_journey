/*
Develop a Flutter app using Dart programming that calculates 
the Restaurant Tip amount based on the total bill and the 
selected Tip percentage. The app should include input fields 
for users to enter the bill amount, Enter Tip percentage and 
buttons to calculate the Tip. Ensure that the app displays the 
calculated Tip amount and the total bill, using Indian currency (INR)
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  const TipCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(), 
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  final TextEditingController _billamountController = TextEditingController();
  final TextEditingController _tipPercentageController = TextEditingController();
  String _result = '';

  void calculateTip() {
  
    double bill = double.tryParse(_billamountController.text) ?? 0;
    double percentage = double.tryParse(_tipPercentageController.text) ?? 0;

    setState(() {
      if (bill <= 0 || percentage <= 0) {
        _result = "Please enter correct amounts.";
      } else {
        
        double tipAmount = (bill * percentage) / 100;
        double totalAmount = bill + tipAmount;

        _result = "Tip: ₹${tipAmount.toStringAsFixed(2)}\nTotal Bill: ₹${totalAmount.toStringAsFixed(2)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INR Tip Calculator'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          fontSize: 25,
          letterSpacing: 1.1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              controller: _billamountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Bill Amount (₹)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            TextField(
              controller: _tipPercentageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tip Percentage (%)', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: calculateTip,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Calculate the Tip',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 30),
            
            Text(
              _result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}