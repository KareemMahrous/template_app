import 'package:flutter/material.dart';

import '../core.dart';

class AppTheme {
  // Text Styles
  static TextTheme lightTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      displayMedium: baseTheme.displayMedium
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      displaySmall: baseTheme.displaySmall
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      headlineLarge: baseTheme.headlineLarge
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      headlineMedium: baseTheme.headlineMedium
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      headlineSmall: baseTheme.headlineSmall
          ?.copyWith(color: AppColors.lightOnSurfaceColor),
      titleLarge:
          baseTheme.titleLarge?.copyWith(color: AppColors.lightOnSurfaceColor),
      titleMedium:
          baseTheme.titleMedium?.copyWith(color: AppColors.lightOnSurfaceColor),
      titleSmall:
          baseTheme.titleSmall?.copyWith(color: AppColors.lightOnSurfaceColor),
      bodyLarge:
          baseTheme.bodyLarge?.copyWith(color: AppColors.lightOnSurfaceColor),
      bodyMedium:
          baseTheme.bodyMedium?.copyWith(color: AppColors.lightOnSurfaceColor),
      bodySmall:
          baseTheme.bodySmall?.copyWith(color: AppColors.lightOnSurfaceColor),
      labelLarge:
          baseTheme.labelLarge?.copyWith(color: AppColors.lightOnSurfaceColor),
      labelMedium:
          baseTheme.labelMedium?.copyWith(color: AppColors.lightOnSurfaceColor),
      labelSmall:
          baseTheme.labelSmall?.copyWith(color: AppColors.lightOnSurfaceColor),
    );
  }

  static TextTheme darkTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
      displayLarge:
          baseTheme.displayLarge?.copyWith(color: AppColors.darkOnSurfaceColor),
      displayMedium: baseTheme.displayMedium
          ?.copyWith(color: AppColors.darkOnSurfaceColor),
      displaySmall:
          baseTheme.displaySmall?.copyWith(color: AppColors.darkOnSurfaceColor),
      headlineLarge: baseTheme.headlineLarge
          ?.copyWith(color: AppColors.darkOnSurfaceColor),
      headlineMedium: baseTheme.headlineMedium
          ?.copyWith(color: AppColors.darkOnSurfaceColor),
      headlineSmall: baseTheme.headlineSmall
          ?.copyWith(color: AppColors.darkOnSurfaceColor),
      titleLarge:
          baseTheme.titleLarge?.copyWith(color: AppColors.darkOnSurfaceColor),
      titleMedium:
          baseTheme.titleMedium?.copyWith(color: AppColors.darkOnSurfaceColor),
      titleSmall:
          baseTheme.titleSmall?.copyWith(color: AppColors.darkOnSurfaceColor),
      bodyLarge:
          baseTheme.bodyLarge?.copyWith(color: AppColors.darkOnSurfaceColor),
      bodyMedium:
          baseTheme.bodyMedium?.copyWith(color: AppColors.darkOnSurfaceColor),
      bodySmall:
          baseTheme.bodySmall?.copyWith(color: AppColors.darkOnSurfaceColor),
      labelLarge:
          baseTheme.labelLarge?.copyWith(color: AppColors.darkOnSurfaceColor),
      labelMedium:
          baseTheme.labelMedium?.copyWith(color: AppColors.darkOnSurfaceColor),
      labelSmall:
          baseTheme.labelSmall?.copyWith(color: AppColors.darkOnSurfaceColor),
    );
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppColors.lightPrimaryColor,
      primaryContainer: AppColors.lightPrimaryVariantColor,
      secondary: AppColors.lightSecondaryColor,
      secondaryContainer: AppColors.lightSecondaryVariantColor,
      surface: AppColors.lightSurfaceColor,
      error: AppColors.lightErrorColor,
      onPrimary: AppColors.lightOnPrimaryColor,
      onSecondary: AppColors.lightOnSecondaryColor,
      onSurface: AppColors.lightOnSurfaceColor,
      onError: AppColors.lightOnErrorColor,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.lightPrimaryColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle:
          lightTextTheme(ThemeData.light().textTheme).titleLarge?.copyWith(
                color: AppColors.lightOnPrimaryColor,
              ),
      iconTheme: const IconThemeData(color: AppColors.lightOnPrimaryColor),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightOnBackgroundColor),
    cardTheme: const CardTheme(
      color: AppColors.lightSurfaceColor,
      elevation: 4.0,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightPrimaryColor;
        }
        return AppColors.lightOnSurfaceColor;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((state) =>
          (state.contains(WidgetState.selected))
              ? AppColors.lightOnPrimaryColor
              : AppColors.lightPrimaryColor),
    ),
    textTheme: lightTextTheme(ThemeData.light().textTheme),
    useMaterial3: true,
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppColors.darkPrimaryColor,
      primaryContainer: AppColors.darkPrimaryVariantColor,
      secondary: AppColors.darkSecondaryColor,
      secondaryContainer: AppColors.darkSecondaryVariantColor,
      surface: AppColors.darkSurfaceColor,
      error: AppColors.darkErrorColor,
      onPrimary: AppColors.darkOnPrimaryColor,
      onSecondary: AppColors.darkOnSecondaryColor,
      onSurface: AppColors.darkOnSurfaceColor,
      onError: AppColors.darkOnErrorColor,
      brightness: Brightness.dark,
    ),
    primaryColor: AppColors.darkPrimaryColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      titleTextStyle:
          darkTextTheme(ThemeData.dark().textTheme).headlineLarge?.copyWith(
                color: AppColors.darkOnPrimaryColor,
              ),
      iconTheme: const IconThemeData(color: AppColors.darkOnPrimaryColor),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.darkPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkPrimaryColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkOnBackgroundColor),
    cardTheme: const CardTheme(
      color: AppColors.darkSurfaceColor,
      elevation: 4.0,
    ),
    textTheme: darkTextTheme(ThemeData.dark().textTheme),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.darkPrimaryColor;
        }
        return AppColors.darkOnSurfaceColor;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((state) =>
          (state.contains(WidgetState.selected))
              ? AppColors.darkOnPrimaryColor
              : AppColors.darkPrimaryColor),
    ),
    useMaterial3: true,
  );
}
