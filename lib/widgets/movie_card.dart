import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  final String title;
  final String poster;
  final double rating;

  const MovieCard({
    super.key,
    required this.title,
    required this.poster,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              poster,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "⭐ $rating",
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}