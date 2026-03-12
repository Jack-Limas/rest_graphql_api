import 'package:flutter/material.dart';
import '../services/graphql_service.dart';

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

          return ListView.builder(

            itemCount: data.length,

            itemBuilder: (context, index) {

              final movie = data[index];

              double rating = ((index % 5) + 6).toDouble();

              return Card(

                color: Colors.grey[900],

                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                elevation: 6,

                child: Padding(

                  padding: const EdgeInsets.all(10),

                  child: Row(

                    children: [

                      ClipRRect(

                        borderRadius: BorderRadius.circular(10),

                        child: Image.network(

                          "https://picsum.photos/200/300?random=$index",

                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,

                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              movie['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              movie['body'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [

                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),

                              ],
                            )

                          ],
                        ),
                      )

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}