import 'package:flutter/material.dart';

class AppState {
  AppState({
    this.themeMode = ThemeMode.light,
    this.kickedOff = false,
    this.locale = const Locale('en'),
  });

  bool get isLightTheme => themeMode == ThemeMode.light;

  final ThemeMode themeMode;
  final bool kickedOff;
  final Locale locale;

  AppState copyWith({
    ThemeMode? themeMode,
    bool? kickedOff,
    Locale? locale,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      kickedOff: kickedOff ?? this.kickedOff,
      locale: locale ?? this.locale,
    );
  }
}
