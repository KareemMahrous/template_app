part of 'localization_bloc.dart';

sealed class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class UpdateLocalization extends LocalizationEvent {
  final String locale;

  const UpdateLocalization({required this.locale});

  @override
  List<Object> get props => [locale];
}
