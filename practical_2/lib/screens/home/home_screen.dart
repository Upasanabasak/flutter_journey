import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My profile"),
        backgroundColor: Colors.green[300],
        centerTitle: true,
      ),

      body: Container(
        padding: const EdgeInsets.all(80),
        // color: Colors.deepOrangeAccent
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://wallpapers.com/images/featured/cute-girls-pictures-s6n2mpx5z32vw9bw.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Colors.pinkAccent, width: 3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // vertical gap , bottom margin

            // Name
            const Text(
              "Upasana Basak",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // about me ,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore \n"
                " et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \n"
                " ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat \n"
                "nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),

            // add contact info and social media links
          ],
        ),
      ),
    );
  }
}
