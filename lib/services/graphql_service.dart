import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  static HttpLink httpLink = HttpLink(
    'https://tmdb.apps.quintero.io/',
  );

  static GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );

  static Future<List> fetchMovies() async {

    const query = """
    query {
      movies {
        title
        poster_path
        vote_average
      }
    }
    """;

    final result = await client.query(
      QueryOptions(document: gql(query)),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['movies'];
  }
}