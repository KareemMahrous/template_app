import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../di_container.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
      : super(  LocalizationSelectedState(
            locale: Locale(preferences.getString(SharedKeys.locale) ?? 'ar'))) {
    on<UpdateLocalization>((event, emit) {
      preferences.setString(SharedKeys.locale, event.locale);
      emit(LocalizationSelectedState(locale: Locale(event.locale)));
    });
  }
}
