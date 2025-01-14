import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'di_container.dart';
import 'template_app.dart';

void main() async {
  /// Ensures that the Flutter framework is properly initialized
  /// before executing any other code. This is necessary when
  /// using async code in the main function.
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets a custom Bloc observer to monitor and handle all Bloc events and transitions.
  Bloc.observer = CustomBlocObserver();

  /// Initializes the dependency injection system.
  await initDependencyInjection();

  /// Runs the main application widget.
  runApp(const TemplateApp());
}
