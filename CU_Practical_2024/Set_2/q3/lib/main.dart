/*
Develop a single-page app using Flutter with the following features: 
• An AppBar displaying the app name as 'XYZ Tour & Travels." 
• A side drawer with the name 'Tourist-spots'. 
• A floating action button that, when clicked, navigates to a page 
  displaying pictures of different tourist places. 

*/

import 'package:flutter/material.dart';

void main() {
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
        titleTextStyle: const TextStyle(
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
              decoration: BoxDecoration(color: Colors.pinkAccent),
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
              leading: const Icon(Icons.place),
              title: const Text('Explore Destinations'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to XYZ Tour & Travels!',
          style: TextStyle(fontSize: 20),
        ),
      ),
      // --- Added Floating Action Button ---
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.photo_library, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GalleryPage()),
          );
        },
      ),
    );
  }
}

// --- New Page to display pictures ---
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  final List<String> imageUrls = const [
    'https://images.unsplash.com/photo-1502602898657-3e91760cbb34', // Paris
    'https://images.unsplash.com/photo-1523906834658-6e24ef2386f9', // Venice
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e', // Kyoto
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Places'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
