import 'package:dartz/dartz.dart';
import 'package:template/domain/domain.dart';

import '../../core/core.dart';
import '../app.dart';

/// The `PokeUsecase` class is responsible for handling use cases related to Pokémon data.
/// It interacts with both RESTful API and GraphQL contracts to fetch data.
class PokeUsecase {
  /// The RESTful API contract to fetch data.
  final PokeRestfulApiContract _pokeContract;

  /// The GraphQL contract to fetch data.
  final PokeGraphContract _pokeGraphContract;

  /// Constructor that initializes the use case with the given contracts.
  PokeUsecase(
      {required PokeRestfulApiContract pokeContract,
      required PokeGraphContract pokeGraphContract})
      : _pokeContract = pokeContract,
        _pokeGraphContract = pokeGraphContract;

  /// Method to fetch Pokémon data using the RESTful API contract.
  /// Takes an optional integer parameter [params] which could be used as a limit or identifier.
  /// Returns an `Either` object containing a `Failure` or a list of Pokémon names as `List<String>`.
  Future<Either<Failure, List<String>>> call(int? params) async {
    // Calls the RESTful API contract with the given parameter.
    final result = await _pokeContract.call(params);
    
    // Processes the result, returning either a failure or the list of Pokémon names.
    return result.fold(
      (l) => Left(l),  // On failure, return the `Failure`.
      (r) => Right(r), // On success, return the list of Pokémon names.
    );
  }

  /// Method to fetch Pokémon data using the GraphQL contract.
  /// Takes an optional integer parameter [params] which could be used as a limit or identifier.
  /// Returns an `Either` object containing a `Failure` or a list of Pokémon entities as `List<PokeEntity>`.
  Future<Either<Failure, List<PokeEntity>>> callGraph(int? params) async {
    // Calls the GraphQL contract with the given parameter.
    final result = await _pokeGraphContract.call(params);
    
    // Processes the result, returning either a failure or the list of Pokémon entities.
    return result.fold(
      (l) => Left(l),  // On failure, return the `Failure`.
      (r) => Right(r), // On success, return the list of Pokémon entities.
    );
  }
}
