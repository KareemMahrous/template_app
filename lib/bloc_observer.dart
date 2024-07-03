import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom BlocObserver to monitor and log BLoC events and state changes.
class CustomBlocObserver extends BlocObserver {
  /// Called when a BLoC is created.
  /// Logs the creation of the BLoC with its runtime type.
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  /// Called whenever a state change occurs in any BLoC.
  /// Logs the state change with the BLoC's runtime type and the change details.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change');
  }

  /// Called when an error is thrown in any BLoC.
  /// Logs the error along with the BLoC's runtime type.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  /// Called when a BLoC is closed.
  /// Logs the closure of the BLoC with its runtime type.
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}
