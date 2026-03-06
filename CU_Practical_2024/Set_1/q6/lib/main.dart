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
  DateTime? _selectedDate;
  String _ageResult = '';

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dobController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _calculateAge() {
  if (_selectedDate == null) {
    setState(() {
      _ageResult = 'Please select your date of birth';
    });
    return;
  }

  DateTime today = DateTime.now();
  DateTime birthDate = _selectedDate!;

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // If days are negative, borrow days from previous month
  if (days < 0) {
    months--;

    // Get number of days in previous month
    DateTime previousMonth = DateTime(today.year, today.month, 0);
    days += previousMonth.day;
  }

  // If months are negative, borrow months from previous year
  if (months < 0) {
    years--;
    months += 12;
  }

  setState(() {
    _ageResult = 
        'Your age is $years years, $months months, $days days';
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculation'),
        backgroundColor: Colors.lime,
        centerTitle: true,
        titleTextStyle: const TextStyle(
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
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'DOB',
                hintText: 'Select your date of birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: IconButton(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              child: const Text('Calculate Age'),
            ),
            const SizedBox(height: 20),
            Text(
              _ageResult,
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