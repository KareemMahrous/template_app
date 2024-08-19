import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../infrastructure.dart';

/// The `PokeRepoImpl` class implements the `PokeRepo` interface
/// and provides methods to fetch Pokémon data using both REST and GraphQL APIs.
class PokeRepoImpl implements PokeRepo {
  final PokeDataSource _dataSource;

  /// Constructor for `PokeRepoImpl`, requiring a `PokeDataSource` instance.
  PokeRepoImpl({required PokeDataSource pokeDataSource})
      : _dataSource = pokeDataSource;

  /// Fetches Pokémon data using the RESTful API.
  ///
  /// [first] - An optional integer specifying the maximum number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to an `Either<Failure, List<String>>`.
  /// On success, it returns a list of Pokémon names. On failure, it returns a `ServerFailure`.
  @override
  Future<Either<Failure, List<String>>> getPokes(int? first) async {
    try {
      final result = await _dataSource.getPokesRestApi(first);

      // Map the 'results' list from the API response to a list of Pokémon names.
      return Right((result['results'] as List)
          .map((e) => e['name'].toString())
          .toList());
    } catch (e) {
      // In case of an error, return a ServerFailure.
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Fetches Pokémon data using the GraphQL API.
  ///
  /// [first] - An optional integer specifying the maximum number of Pokémon to fetch.
  ///
  /// Returns a `Future` that resolves to an `Either<Failure, List<PokeEntity>>`.
  /// On success, it returns a list of `PokeEntity` objects. On failure, it returns a `ServerFailure`.
  @override
  Future<Either<Failure, List<PokeEntity>>> getPokesGraphql(int? first) async {
    try {
      final result = await _dataSource.getPokesGraphql(first);

      // Map the 'pokemon_v2_pokemonspecies' list from the API response to a list of `PokeEntity` objects.
      return Right((result['pokemon_v2_pokemonspecies'] as List)
          .map((e) => PokeEntity.fromJson(e))
          .toList());
    } catch (e) {
      // In case of an error, return a ServerFailure.
      return Left(ServerFailure(e.toString()));
    }
  }
}
