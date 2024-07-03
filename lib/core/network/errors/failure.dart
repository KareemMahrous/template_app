import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [super.message];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}
