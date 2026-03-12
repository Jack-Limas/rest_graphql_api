import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {

  static final HttpLink httpLink = HttpLink(
    'https://graphqlzero.almansi.me/api',
  );

  static final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  );

  static Future<List> fetchMovies() async {

    const String query = """
    query {
      posts(options: {paginate: {page: 1, limit: 20}}) {
        data {
          id
          title
          body
        }
      }
    }
    """;

    final result = await client.query(
      QueryOptions(document: gql(query)),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return result.data?['posts']['data'];
  }
}