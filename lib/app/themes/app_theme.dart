import 'package:anime_meme_generator/app/themes/styles/colors.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkScheme,
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ), // AppBar title
      bodyMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      )),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.green0,
  ),
  cardTheme: const CardTheme(
    color: AppColors.green0,
    shadowColor: Color(0xFF8f2589),
    elevation: 12,
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
