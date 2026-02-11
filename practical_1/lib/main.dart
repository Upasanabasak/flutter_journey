import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'family1'
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String msg = "Hello! Flutter";
  void changeTxt(){
  setState(() {
   msg = "Hello! World Hello! World Hello! World";
  });
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic flutter App"),
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg,
              // textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: const TextStyle(fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.redAccent,
                                      letterSpacing: 2.5,
                                      height: -1.5,
                                      // decoration: TextDecoration.overline,
                                      // decorationColor: Colors.amberAccent,
                                      // decorationThickness: 2.0
                                      // fontFamily: 'family1',
                                      // 
                                      backgroundColor: Colors.yellowAccent 
                                      ),
              ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeTxt,
            child: Text("Change msg"))
          ],
        ),
        ),
    );
  }
}