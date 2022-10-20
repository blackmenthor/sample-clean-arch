import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/theme/colors.dart';

class AppTheme {

  ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme(
      onPrimary: AppColors.virdianGreen,
      onSecondary: AppColors.phthaloGreen,
      primary: AppColors.virdianGreen,
      secondary: AppColors.phthaloGreen,
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
      onPrimary: AppColors.teaGreen,
      onSecondary: AppColors.canary,
      primary: AppColors.teaGreen,
      secondary: AppColors.canary,
      surface: Colors.grey.withOpacity(0.25),
      onSurface: Colors.grey.withOpacity(0.25),
      background: Colors.white,
      onBackground: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      brightness: Brightness.light,
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

}
