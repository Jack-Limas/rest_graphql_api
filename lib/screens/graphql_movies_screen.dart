import 'package:flutter/material.dart';
import '../services/graphql_service.dart';
import '../widgets/movie_card.dart';

class GraphQLMoviesScreen extends StatefulWidget {
  const GraphQLMoviesScreen({super.key});

  @override
  State<GraphQLMoviesScreen> createState() => _GraphQLMoviesScreenState();
}

class _GraphQLMoviesScreenState extends State<GraphQLMoviesScreen> {

  late Future<List> movies;

  @override
  void initState() {
    super.initState();
    movies = GraphQLService.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Películas GraphQL"),
        backgroundColor: Colors.teal,
      ),

      body: FutureBuilder<List>(

        future: movies,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          final data = snapshot.data!;

          return GridView.builder(

            padding: const EdgeInsets.all(10),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,

            ),

            itemCount: data.length,

            itemBuilder: (context, index) {

              final movie = data[index];

              return MovieCard(

                title: movie['title'] ?? "Sin título",

                poster:
                    "https://image.tmdb.org/t/p/w500${movie['poster_path']}",

                rating: (movie['vote_average'] ?? 0).toDouble(),
              );
            },
          );
        },
      ),
    );
  }
}