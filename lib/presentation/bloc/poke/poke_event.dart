part of 'poke_bloc.dart';

/// [PokeEvent] is Base Event
sealed class PokeEvent extends Equatable {
  const PokeEvent();

  @override
  List<Object> get props => [];
}

/// [GetPokes] is Get Pokes Event from RestfulApi
class GetPokesRest extends PokeEvent {
  final int? limit;

  const GetPokesRest({required this.limit});
}

/// [GetPokes] is Get Pokes Event from GraphQl
class GetPokesGraphql extends PokeEvent {
  final int? limit;

  const GetPokesGraphql({required this.limit});
}
