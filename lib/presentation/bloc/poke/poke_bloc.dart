import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../app/usecases/poke_usecase.dart';

part 'poke_event.dart';
part 'poke_state.dart';

class PokeBloc extends Bloc<PokeEvent, PokeState> {
  final PokeUsecase _pokeUsecase;
  PokeBloc({required PokeUsecase pokeUsecase})
      : _pokeUsecase = pokeUsecase,
        super(PokeInitial()) {
    on<GetPokesRest>(_handleGetPokes);
    on<GetPokesGraphql>(_handleGetPokesGraphql);
  }

  /// _handleGetPokes is used for handling GetPokesRest Event
  FutureOr<void> _handleGetPokes(GetPokesRest event, emit) async {
    emit(PokeLoading());
    /// simulate api response time
    await Future.delayed(const Duration(seconds: 2));
    final result = await _pokeUsecase.call(event.limit);
    result.fold((failure) => emit(PokeFailure(message: failure.message)),
        (pokes) => emit(PokeSuccess(pokes: pokes, type: 'Rest Api')));
  }

  /// _handleGetPokesGraphql is used for handling GetPokesGraphql Event
  FutureOr<void> _handleGetPokesGraphql(GetPokesGraphql event, emit) async {
    emit(PokeLoading());
    /// simulate graphql response time
    await Future.delayed(const Duration(seconds: 2));
    final result = await _pokeUsecase.call(event.limit);
    result.fold((failure) => emit(PokeFailure(message: failure.message)),
        (pokes) => emit(PokeSuccess(pokes: pokes, type: 'Graphql')));
  }
}
