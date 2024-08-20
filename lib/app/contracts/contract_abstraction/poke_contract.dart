import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../app.dart';

/// Contract for the RESTful API operations related to Pokémon data.
/// This class extends `BaseCallableClass`, which provides a standard interface for callable classes.
abstract class PokeRestfulApiContract
    extends BaseCallableClass<Future<Either<Failure, List<String>>>, int?> {}

/// Contract for the GraphQL operations related to Pokémon data.
/// This class also extends `BaseCallableClass`, but with a different return type and input parameter.
abstract class PokeGraphContract extends BaseCallableClass<
    Future<Either<Failure, List<PokeEntity>>>, int?> {}
