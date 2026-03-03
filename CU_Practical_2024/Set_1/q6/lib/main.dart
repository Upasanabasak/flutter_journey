/* Create a Flutter app using Dart programming that calculates a person's age 
based on his/her date of birth. The app should include an input field, a button 
to trigger the calculation and a display area to show the result. 
*/

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

void main() {
  runApp(const AgeApp());
}

class AgeApp extends StatelessWidget {
  const AgeApp({super.key});

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
  final TextEditingController _dobController = TextEditingController();
  String _ageResult = '';

  void _calculateAge() {
    try {
      DateTime dob = DateFormat('yyyy-MM-dd').parse(_dobController.text);
      DateTime today = DateTime.now();

      int age = today.year - dob.year;
      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        age--;
      }

      setState(() {
        _ageResult = 'Your age is $age years';
      });
    } catch (e) {
      setState(() {
        _ageResult = 'Invalid date format. Use YYYY-MM-DD';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculation'),
        backgroundColor: Colors.lime,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.indigoAccent,
          fontSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dobController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'DOB',
                hintText: 'Enter your date of birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month_outlined),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _calculateAge, child: Text('Calculate Age')),
          ],
        ),
      ),
    );
  }
}
