import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

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
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _result = "";
  double? _bmi;

  void bmiCalculation() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      double meter = height / 100;
      double value = weight / (meter * meter);

      String category;

     
      if (value < 18.5) {
        category = "Underweight";
      } else if (value >= 18.5 && value <= 24.9) {
        category = "Normal Weight";
      } else if (value > 24.9 && value <= 29.9) {
        category = "Overweight";
      } else {
        category = "Obese";
      }

      setState(() {
        _bmi = value;
        _result = category;
      });
    }
    else 
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Must enter greater than zero for both weight and height',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculation'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 15, 132, 75),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: bmiCalculation,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 40),

            
            if (_result.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Your BMI: ${_bmi!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'You are $_result',
                    style: const TextStyle(
                      fontSize: 27,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
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
