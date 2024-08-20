import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'presentation/bloc/theme/theme_bloc.dart';

import 'app/routing/routing.dart';
import 'bloc_observer.dart';
import 'core/core.dart';
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
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: allRoutes,
            theme: AppTheme.lightTheme.copyWith(
                textTheme: Theme.of(context)
                    .textTheme
                    .apply(bodyColor: AppColors.lightOnBackgroundColor)),
            darkTheme: AppTheme.darkTheme.copyWith(
                textTheme: Theme.of(context)
                    .textTheme
                    .apply(bodyColor: AppColors.darkOnBackgroundColor)),
            themeMode: (state as ThemeChanged).themeMode,
            debugShowCheckedModeBanner: false,
            title: AppConfig.appName,

            /// Sets the default locale for the application.
            locale: const Locale('en', 'US'),
            localizationsDelegates: AppLang.localizationsDelegates,
            supportedLocales: AppLang.supportedLocales,
          );
        },
      ),
    );
  }
}
