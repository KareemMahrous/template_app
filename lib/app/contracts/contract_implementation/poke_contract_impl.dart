import 'package:dartz/dartz.dart';

import '../../../core/network/errors/failure.dart';
import '../../../domain/domain.dart';
import '../contract_abstraction/poke_contract.dart';

/// Implementation of the PokeRestfulApiContract interface for interacting with the RESTful Pokémon API.
class PokeRestContractImpl implements PokeRestfulApiContract {
  // The repository instance used to fetch Pokémon data from a RESTful API.
  final PokeRepo _pokeRepo;

  /// Constructor that initializes the contract with a repository.
  /// 
  /// [pokeRepo] - The repository instance used to perform data operations.
  const PokeRestContractImpl({required PokeRepo pokeRepo})
      : _pokeRepo = pokeRepo;

  /// Executes the contract operation to fetch Pokémon names from the RESTful API.
  /// 
  /// [params] - An optional integer parameter used for pagination or limiting the number of results.
  /// 
  /// Returns a [Future] that resolves to either a [Failure] or a [List<String>] of Pokémon names.
  @override
  Future<Either<Failure, List<String>>> call(int? params) {
    return _pokeRepo.getPokes(params);
  }
}

/// Implementation of the PokeGraphContract interface for interacting with the GraphQL Pokémon API.
class PokeGraphContractImpl implements PokeGraphContract {
  // The repository instance used to fetch Pokémon data from a GraphQL API.
  final PokeRepo _pokeRepo;

  /// Constructor that initializes the contract with a repository.
  /// 
  /// [pokeRepo] - The repository instance used to perform data operations.
  const PokeGraphContractImpl({required PokeRepo pokeRepo})
      : _pokeRepo = pokeRepo;

  /// Executes the contract operation to fetch detailed Pokémon data from the GraphQL API.
  /// 
  /// [params] - An optional integer parameter used for pagination or limiting the number of results.
  /// 
  /// Returns a [Future] that resolves to either a [Failure] or a [List<PokeEntity>] of Pokémon entities.
  @override
  Future<Either<Failure, List<PokeEntity>>> call(int? params) {
    return _pokeRepo.getPokesGraphql(params);
  }
}
