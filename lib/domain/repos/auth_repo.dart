import 'package:dartz/dartz.dart';

import '../../core/network/errors/failure.dart';
import '../entities/login_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String username,
    required String password,
  });

  Future<Either<Failure, LoginEntity>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
    required String password,
  });
}
