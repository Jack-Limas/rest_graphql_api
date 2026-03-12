import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class RestService {

  final String apiKey = "eda053afeeb5844bfd8753b77d4c6fbd";

  Future<List<Movie>> fetchMovies() async {

    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);

      List results = data['results'];

      return results.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Error al cargar películas");
    }
  }
}