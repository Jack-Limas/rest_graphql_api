import 'package:flutter/material.dart';
import 'rest_movies_screen.dart';
import 'graphql_movies_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.deepPurple,

      appBar: AppBar(
        title: const Text("🎬 Movie Explorer"),
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.all(20),
              ),
              child: const Text("Películas REST"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RestMoviesScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.all(20),
              ),
              child: const Text("Películas GraphQL"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GraphQLMoviesScreen(),
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}