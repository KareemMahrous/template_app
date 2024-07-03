import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'di_container.dart';

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
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
