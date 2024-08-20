part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
  
  @override
  List<Object> get props => [];
}

final class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;
  const ThemeChanged({required this.themeMode});
  @override
  List<Object> get props => [themeMode];
}
