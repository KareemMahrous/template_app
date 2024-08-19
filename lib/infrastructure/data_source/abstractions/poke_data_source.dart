/// The `PokeDataSource` abstract class defines the contract for data sources
/// that will fetch Pokémon data from different APIs (REST or GraphQL).
abstract class PokeDataSource {
  
  /// Fetches a list of Pokémon data from a RESTful API.
  ///
  /// [limit] - An optional integer parameter that could specify the number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to a `Map<String, dynamic>` containing the Pokémon data.
  Future<Map<String, dynamic>> getPokesRestApi(int? limit);
  
  /// Fetches a list of Pokémon data from a GraphQL API.
  ///
  /// [limit] - An optional integer parameter that could specify the number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to a `Map<String, dynamic>` containing the Pokémon data.
  Future<Map<String, dynamic>> getPokesGraphql(int? limit);
}
