import 'package:anime_meme_generator/app/themes/styles/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkScheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.green0,
  ),
  cardTheme: const CardTheme(
    color: AppColors.green0,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: _resolver<Color>(
        (states) => AppColors.lightBlue0,
      ),
    ),
  ),
);

const darkScheme = ColorScheme.dark(
  onSurface: AppColors.lightBlue0,
  onBackground: AppColors.lightBlue0,
);

// parameterized type to shorten resolver
MaterialStateProperty<T?>? _resolver<T>(T Function(Set<MaterialState>) func) => MaterialStateProperty.resolveWith(func);
