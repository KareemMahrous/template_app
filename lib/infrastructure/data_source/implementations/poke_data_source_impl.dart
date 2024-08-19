import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../core/core.dart';
import '../../infrastructure.dart';

/// The `PokeDataSourceImpl` class implements the `PokeDataSource` interface
/// and provides methods to fetch Pokémon data using both REST and GraphQL APIs.
class PokeDataSourceImpl implements PokeDataSource {
  final BaseDio _baseDio;          // Handles HTTP requests.
  final GraphService _graphService; // Handles GraphQL queries.

  /// Constructor for `PokeDataSourceImpl`, requiring instances of `GraphService` and `BaseDio`.
  PokeDataSourceImpl(
      {required GraphService graphService, required BaseDio baseDio})
      : _baseDio = baseDio,
        _graphService = graphService;

  /// Fetches Pokémon data using the RESTful API.
  ///
  /// [limit] - An optional integer specifying the maximum number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to a `Map<String, dynamic>` containing the API response.
  @override
  Future<Map<String, dynamic>> getPokesRestApi(int? limit) async {
    // Sends a GET request to the "pokemon" endpoint with the specified limit and offset.
    final response = await _baseDio.get(
      "pokemon",
      queryParameters: {'limit': limit, 'offset': 20},
    );

    // Returns the response data as a Map.
    return response.data;
  }

  /// Fetches Pokémon data using the GraphQL API.
  ///
  /// [limit] - An optional integer specifying the maximum number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to a `Map<String, dynamic>` containing the API response.
  @override
  Future<Map<String, dynamic>> getPokesGraphql(int? limit) async {
    // Sends a GraphQL query with the specified limit, using no cache.
    final response = await _graphService.client.query(
      QueryOptions(
          document: gql(getPokesQuery),
          variables: {'limit': limit},
          fetchPolicy: FetchPolicy.noCache),
    );

    // Returns the 'data' field from the GraphQL response.
    return response.data!['data'];
  }
}
