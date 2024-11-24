part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  const LocalizationState();

  @override
  List<Object> get props => [];
}

final class LocalizationSelectedState extends LocalizationState {
   final Locale locale;

  const LocalizationSelectedState({required this.locale});

  @override
  List<Object> get props => [locale];
}
