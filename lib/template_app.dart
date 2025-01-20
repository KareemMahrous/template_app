import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/di_container.dart';

import 'app/routing/routing.dart';
import 'core/core.dart';
import 'core/theme/app_theme.dart';
import 'presentation/bloc/bloc.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => LocalizationBloc()
            ..add(UpdateLocalization(
                locale: preferences.getString(SharedKeys.locale) ??
                    Localizations.localeOf(context).languageCode)),
        ),
      ],
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
            locale: (context.read<LocalizationBloc>().state
                    as LocalizationSelectedState)
                .locale,
            localizationsDelegates: AppLang.localizationsDelegates,
            supportedLocales: AppLang.supportedLocales,
          );
        },
      ),
    );
  }
}
