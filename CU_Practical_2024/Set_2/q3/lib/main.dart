/*
Develop a single-page app using Flutter with the following features: 
• An AppBar displaying the app name as 'XYZ Tour & Travels." 
• A side drawer with the name 'Tourist-spots'. 
*/

import 'package:flutter/material.dart';
void main () {
  runApp(const TourApp());
}

class TourApp extends StatelessWidget {
  const TourApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XYZ Tour & Travels.'),
        backgroundColor: Colors.pink,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text(
                'Tourist-spots',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              ListTile(
                leading: Icon(Icons.place),
                title: const Text('Explore Destinations'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to XYZ Tour & Travels!',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
          ],
        ),
      ),
    );
  }
}