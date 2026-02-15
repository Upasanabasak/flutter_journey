import 'package:flutter/material.dart';
void main() {
  runApp(BarbecueStationApp());
}
class BarbecueStationApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbecue Station',
  home: HomePage(),
  );
}
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Barbecue Station'),
    ),
    drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
    DrawerHeader(
    decoration: BoxDecoration(color: Colors.blue),
    child: Text(
    'Cuisine List',
    style: TextStyle(color: Colors.white, fontSize: 24),
    ),
    ),
    ListTile(
    title: Text('Pizza'),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PizzaPage()),
      );
    },
    ),
    ListTile(
    title: Text('Burgers'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ListTile(
    title: Text('Barbecue'),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    ],
    ),
    ),
    body: Center(
    child: Text(
    'Welcome to Barbecue Station!',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PizzaPage()),
    );
    },
    child: Icon(Icons.local_pizza),
    tooltip: 'Go to Pizza Page',
    ),
    );
  }
}
class PizzaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Pizza Gallery'),
    ),
    body: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
    ),
    padding: const EdgeInsets.all(8.0),
    itemCount: 6,
    itemBuilder: (context, index) {
    return Card(
    elevation: 5,
    child: Image.asset(
    'assets/images/pizza${index + 1}.jpg',
    fit: BoxFit.cover,
    ),
    );
    },
    ),
    );
  }
}
