import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/theme/colors.dart';

class AppTheme {

  ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.orangePeel,
      onPrimary: AppColors.white,
      secondary: AppColors.virdianGreen,
      onSecondary: AppColors.virdianGreen.withOpacity(0.5),
      surface: Colors.grey.withOpacity(0.25),
      onSurface: Colors.grey.withOpacity(0.25),
      background: Colors.black.withOpacity(0.5),
      onBackground: Colors.black.withOpacity(0.5),
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
      ),
    ),
  );

  ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.canary,
      onPrimary: AppColors.black,
      secondary: AppColors.teaGreen,
      onSecondary: AppColors.teaGreen.withOpacity(0.5),
      surface: Colors.grey.withOpacity(0.25),
      onSurface: Colors.grey.withOpacity(0.25),
      background: Colors.white,
      onBackground: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.light,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 32,
      ),
    ),
  );

}
