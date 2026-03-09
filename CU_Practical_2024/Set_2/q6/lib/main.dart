/* 
Develop a Flutter app using a stateful widget that changes the AppBar name 
when the user enters a name. The app should include an input field for the user 
to enter their name, and the AppBar title should update accordingly.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const NameChangerApp());
}

class NameChangerApp extends StatelessWidget {
  const NameChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NameInputScreen(),
    );
  }
}

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  // Controller to listen to text changes
  final TextEditingController _nameController = TextEditingController();

  // Variable to store the current AppBar title
  String _appBarTitle = "Enter Your Name";

  @override
  // void initState() {
  //   super.initState();
  //   // Adding a listener to update the state as the user types
  //   _nameController.addListener(_updateTitle);
  // }

  void _updateTitle() {
    setState(() {
      // If the field is empty, show a default title
      _appBarTitle = _nameController.text.isEmpty
      ? "Enter your name"
      : _nameController.text;
    });
  }

  @override
  // void dispose() {
  //   _nameController.dispose(); // Always dispose controllers to save memory
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle), // This updates reactively
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Type below to change the Header:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                hintText: "e.g. Gemini User",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
