/*
Develop a Flutter Recipe App using Dart programming 
Create a recipe app that displays a list of recipes. 
Each recipe should have a detail page with ingredients and 
instructions. Implement navigation between the list and detail pages. 
*/

import 'package:flutter/material.dart';

void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  // Sample Data
  final List<Recipe> recipes = [
    Recipe(
      'Spaghetti Bolognese',
      'https://images.unsplash.com/photo-1622973536968-3ead9e780960',
      ['Spaghetti', 'Ground Beef', 'Tomato Sauce', 'Onion'],
      ['Boil pasta.', 'Fry beef and onion.', 'Add sauce.', 'Mix together.'],
    ),
    Recipe(
      'Fruit Salad',
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe',
      ['Apple', 'Banana', 'Grapes', 'Honey'],
      [
        'Chop all fruits.',
        'Place in bowl.',
        'Drizzle honey.',
        'Serve chilled.',
      ],
    ),
  ];

  RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Recipes')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to Detail Page
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    recipes[index].imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recipes[index].label,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.label)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(recipe.imageUrl),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ...recipe.ingredients.map(
              (item) =>
                  ListTile(leading: const Icon(Icons.check), title: Text(item)),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Instructions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipe.instructions.asMap().entries.map((entry) {
                  return Text(
                    '${entry.key + 1}. ${entry.value}\n',
                    style: const TextStyle(fontSize: 16),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
