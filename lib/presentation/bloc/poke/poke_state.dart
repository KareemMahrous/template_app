part of 'poke_bloc.dart';

/// [PokeState] is Base State
sealed class PokeState extends Equatable {
  const PokeState();

  @override
  List<Object> get props => [];
}

/// [PokeInitial] is Initial State
final class PokeInitial extends PokeState {}

/// [PokeLoading] is Loading State
final class PokeLoading extends PokeState {}

/// [PokeSuccess] is Success State
final class PokeSuccess extends PokeState {
  final List<String> pokes;
  final String type;

  const PokeSuccess({required this.pokes, required this.type});

/// identityHashCode(this) is used for refreshing the same state
  @override
  List<Object> get props => [pokes, identityHashCode(this)];
}

/// [PokeFailure] is Failure State
final class PokeFailure extends PokeState {
  final String message;

  const PokeFailure({required this.message});

  @override
  List<Object> get props => [message];
}
