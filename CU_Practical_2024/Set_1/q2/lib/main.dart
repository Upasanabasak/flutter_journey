/*Develop a Flutter app using Dart programming to build a basic 
mathematical calculator app that can perform addition, subtraction, 
multiplication, and division. Use 'Text Field' for input and Raised Button' for operations.*/
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

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
  final TextEditingController _num1Controller = TextEditingController();
final TextEditingController _num2Controller = TextEditingController();
double _result = 0;
void add() {
    setState(() {
      double num1 = double.tryParse(_num1Controller.text) ?? 0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0;
      _result = num1 + num2;
    });
  }
  void subtraction () {
    setState(() {
      double num1 = double.tryParse(_num1Controller.text) ?? 0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0;
      _result = num1 - num2;
    });
  }
  void multiplication () {
    setState(() {
      double num1 = double.tryParse(_num1Controller.text) ?? 0;
      double num2 = double.tryParse(_num2Controller.text) ?? 0;
      _result = num1 * num2;
    });
  }
  void division() {
  setState(() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    double num2 = double.tryParse(_num2Controller.text) ?? 0;
    if (num2 != 0) {
      _result = num1 / num2;
    } else {
      // Show snackbar error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content : Text('Division by zero is not allowed!')),);
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Calculator"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 196, 60, 60),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter 1st number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter 2nd number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: add,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  child: Text("+"),  
                ),
                ElevatedButton(
                  onPressed: subtraction,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  child: Text("-"),  
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: multiplication,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  child: Text("*"),  
                ),
                ElevatedButton(
                  onPressed: division,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  child: Text("/"),  
                ),
              ],
            ),
            Text('Result: $_result',
            style: TextStyle(color: const Color.fromARGB(255, 219, 61, 18),fontWeight: FontWeight.bold),
            ),
          ],
        ),),
    );
  }
}