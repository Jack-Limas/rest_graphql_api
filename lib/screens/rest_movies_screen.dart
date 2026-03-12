import 'package:flutter/material.dart';
import '../services/rest_service.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class RestMoviesScreen extends StatefulWidget {
  const RestMoviesScreen({super.key});

  @override
  State<RestMoviesScreen> createState() => _RestMoviesScreenState();
}

class _RestMoviesScreenState extends State<RestMoviesScreen> {

  late Future<List<Movie>> movies;

  @override
  void initState() {
    super.initState();
    movies = RestService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Películas REST"),
        backgroundColor: Colors.deepPurple,
      ),

      body: FutureBuilder<List<Movie>>(

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
                title: movie.title,
                poster: movie.poster,
                rating: movie.rating,
              );
            },
          );
        },
      ),
    );
  }
}