import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _ageController.dispose();
  //   super.dispose();
  // }

  // void _checkEligibility() {
  //   String name = _nameController.text.trim();
  //   int? age = int.tryParse(_ageController.text.trim());

  //   if (name.isEmpty || age == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Please enter valid Name and Age"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }

  //   String message;
  //   if (age >= 18) {
  //     message = "$name is Eligible for vote";
  //   } else {
  //     message = "$name is Not Eligible for vote";
  //   }

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: age >= 18 ? Colors.green : Colors.orange,
  //     ),
  //   );
  // }
// void _checkEligibility() {
//   if( age < 0)
//     print()
// }

  void _clearFields() {
    _nameController.clear();
    _ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voter Eligibility App"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              // controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _checkEligibility,
                  child: const Text("Check"),
                ),
                ElevatedButton(
                  onPressed: _clearFields,
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.grey,
                  // ),
                  child: const Text("Clear"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}