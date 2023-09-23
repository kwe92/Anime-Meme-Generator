import 'package:anime_meme_generator/app/themes/styles/colors.dart';
import 'package:anime_meme_generator/app/themes/styles/text_styles.dart';
import 'package:flutter/material.dart';

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
  onBackground: AppColors.lightBlue0,
  background: AppColors.primary,
);

const _textTheme = TextTheme(
  // affects AppBar title
  titleLarge: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w500,
  ),
  // affects base app text
  bodyMedium: baseTextStyle,
);

const _appBarTheme = AppBarTheme(
  backgroundColor: AppColors.secondary,
);

const _cardTheme = CardTheme(
  color: AppColors.secondary,
  // shadowColor: AppColors.grey1,
  elevation: 6,
);

final _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: _resolver<Color>(
      (states) => Colors.white,
    ),
    overlayColor: _resolver(
      (states) => AppColors.grey0,
    ),
    textStyle: _resolver(
      (states) => baseTextStyle,
    ),
  ),
);

/// parameterized utility function to shorten calls to MaterialStateProperty.
MaterialStateProperty<T?>? _resolver<T>(T Function(Set<MaterialState> states) func) => MaterialStateProperty.resolveWith(func);
