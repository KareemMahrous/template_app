import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeChanged(themeMode: ThemeMode.system)) {
    on<ChangeTheme>(_handleThemeChange);
  }

  FutureOr<void> _handleThemeChange(event, emit) async {
    emit(ThemeChanged(themeMode: event.themeMode));
  }
}
