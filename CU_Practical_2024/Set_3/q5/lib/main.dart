/* 
Develop a Flutter app using Dart programming to display a list of 
10 items using a Listview.builder() and allow user to click on an 
item and show details on different or same page. 
*/

import 'package:flutter/material.dart';

void main() => runApp(const MasterDetailApp());

class MasterDetailApp extends StatelessWidget {
  const MasterDetailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView Navigation',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generating a list of 10 items
    final List<Item> items = List.generate(
      10,
      (index) => Item(
        title: 'Item ${index + 1}',
        description:
            'Detailed information for item number ${index + 1}. This is a detailed description of the selected item.',
        imageUrl: 'https://picsum.photos/id/${index + 10}/200/300',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('10 Items List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(items[index].imageUrl),
              ),
              title: Text(items[index].title),
              subtitle: const Text('Tap to see more details'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigating to the Detail Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: items[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  item.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
