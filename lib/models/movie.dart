class Movie {

  final String title;
  final String overview;
  final String poster;
  final double rating;

  Movie({
    required this.title,
    required this.overview,
    required this.poster,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      poster: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      rating: json['vote_average'].toDouble(),
    );
  }

}