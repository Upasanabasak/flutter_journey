import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Counter"),
//         backgroundColor: Colors.amberAccent,
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           fontStyle: FontStyle.italic,
//           color: const Color.fromARGB(255, 202, 22, 31),
//           letterSpacing: 3,
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  void counter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: const Color.fromARGB(255, 202, 22, 31),
          letterSpacing: 3,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $count',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 202, 22, 31),
                letterSpacing: 3,
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: counter, child: Text("Click Me")),
          ],
        ),
      ),
    );
  }
}
