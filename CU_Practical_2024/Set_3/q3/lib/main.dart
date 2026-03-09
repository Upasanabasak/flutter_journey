/* 
Develop a Flutter app using Dart programming that allow user to 
enter name of five fruits and displayd last three names upon 
clicking a button. Include another button that navigates to a 
different or same page. 
*/

import 'package:flutter/material.dart';

void main() => runApp(const FruitApp());

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const FruitInputScreen(),
    );
  }
}

class FruitInputScreen extends StatefulWidget {
  const FruitInputScreen({super.key});

  @override
  State<FruitInputScreen> createState() => _FruitInputScreenState();
}

class _FruitInputScreenState extends State<FruitInputScreen> {
  // A single controller for a comma-separated string, or 5 individual controllers
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  List<String> _displayList = [];

  void _showLastThree() {
    // Collect non-empty values from the controllers
    List<String> fruits = _controllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    setState(() {
      if (fruits.length >= 3) {
        // Extract the last 3 names
        _displayList = fruits.sublist(fruits.length - 3);
      } else {
        _displayList = ["Please enter at least 3 fruits."];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fruit Picker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Enter 5 Fruits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: TextField(
                  controller: _controllers[index],
                  decoration: InputDecoration(
                    labelText: 'Fruit ${index + 1}',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showLastThree,
                  child: const Text('Show Last 3'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    // Navigation to a different page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ),
                    );
                  },
                  child: const Text('Go to Next Page'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_displayList.isNotEmpty)
              Column(
                children: _displayList
                    .map(
                      (f) => Text(
                        f,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    )
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context), // Back to previous page
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
