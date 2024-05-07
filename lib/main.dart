import 'package:flutter/material.dart';
import 'package:recipes_collection/fooderlich_theme.dart';
import 'package:recipes_collection/recipe_detail.dart';
import 'recipe.dart';

void main() {
  runApp(const CollectionApp());
}

class CollectionApp extends StatelessWidget {
  const CollectionApp({super.key});
  final theme = FooderlichTheme.dark();
   @override
        Widget build(BuildContext context) {
      final ThemeData theme = ThemeData();
      return MaterialApp(
        title: 'Welcome 🍹',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.grey,
            secondary: Colors.black,
          ),
        ),
        home: const MyHomePage(title: 'Recipes List'),
      );
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
        // TODO: Replace child: Container()
        // 4
        child: ListView.builder(
          // 5
          itemCount: Recipe.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
