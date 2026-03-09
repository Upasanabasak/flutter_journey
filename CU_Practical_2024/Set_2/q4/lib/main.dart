/*
Develop a Flutter app using Dart programming that allow to submit 
5 random name through text data field and displays same upon 
clicking a button. Include another button that navigates to a 
different or same page. 
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const NameApp());
}

class NameApp extends StatelessWidget {
  const NameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _names = [];
  bool _showNames = false;

  void _addName() {
    if (_controller.text.isNotEmpty && _names.length < 5) {
      setState(() {
        _names.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Name Submitter')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (_names.length < 5) ...[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Name ${_names.length + 1}',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addName,
                child: const Text('Submit Name'),
              ),
            ] else ...[
              const Text(
                'All 5 names collected!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],

            const Divider(height: 40),

            // Button 1: Display the names
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => setState(() => _showNames = true),
              child: const Text(
                'Display Names',
                style: TextStyle(color: Colors.white),
              ),
            ),

            if (_showNames)
              Expanded(
                child: ListView.builder(
                  itemCount: _names.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(_names[index]),
                  ),
                ),
              ),

            // Button 2: Navigate to another page
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: const Text('Go to Second Page'),
              ),
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
      body: const Center(
        child: Text(
          'You have successfully navigated!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
