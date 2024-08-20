import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

/// The `PokeRepo` abstract class defines the contract for any Pokémon repository implementation.
/// It includes methods for fetching Pokémon data via different methods (e.g., RESTful API and GraphQL).
abstract class PokeRepo {
  /// Fetches a list of Pokémon names using a RESTful API.
  ///
  /// [first] - An optional integer parameter that could specify the number of Pokémon to fetch
  ///           or some other parameter relevant to the RESTful API.
  ///
  /// Returns an `Either` type containing a `Failure` object if an error occurs, or a `List<String>`
  /// of Pokémon names on success.
  Future<Either<Failure, List<String>>> getPokes(int? first);

  /// Fetches a list of Pokémon entities using GraphQL.
  ///
  /// [first] - An optional integer parameter that could specify the number of Pokémon to fetch
  ///           or some other parameter relevant to the GraphQL query.
  ///
  /// Returns an `Either` type containing a `Failure` object if an error occurs, or a `List<PokeEntity>`
  /// of Pokémon entities on success.
  Future<Either<Failure, List<PokeEntity>>> getPokesGraphql(int? first);
}
