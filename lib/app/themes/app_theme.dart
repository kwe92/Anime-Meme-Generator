import 'package:anime_meme_generator/app/themes/styles/colors.dart';
import 'package:anime_meme_generator/app/themes/styles/text_styles.dart';
import 'package:flutter/material.dart';

// TODO: style snackbar

/// Theme for the entire app.
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkScheme,
  textTheme: _textTheme,
  appBarTheme: _appBarTheme,
  cardTheme: _cardTheme,
  outlinedButtonTheme: _outlinedButtonThemeData,
);

const _darkScheme = ColorScheme.dark(
  onSurface: AppColors.green0,
  onBackground: AppColors.lightBlue0,
);

final _textTheme = TextTheme(
  // affects AppBar title
  titleLarge: TextStyle(
    foreground: Paint()..color = AppColors.lightBlue0,
    fontSize: 36,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: baseTextStyle,
);

const _appBarTheme = AppBarTheme(
  backgroundColor: AppColors.green0,
);

const _cardTheme = CardTheme(
  color: AppColors.green0,
  shadowColor: AppColors.grey1,
  elevation: 6,
);

final _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: _resolver<Color>(
      (states) => AppColors.lightBlue0,
    ),
    overlayColor: _resolver(
      (states) => AppColors.grey0,
    ),
  ),
);

/// parameterized utility function to shorten calls to MaterialStateProperty.
MaterialStateProperty<T?>? _resolver<T>(T Function(Set<MaterialState> states) func) => MaterialStateProperty.resolveWith(func);
