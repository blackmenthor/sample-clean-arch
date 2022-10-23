import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/cubit/state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  bool get isLight => state.themeMode == ThemeMode.light;
  Locale get locale => state.locale;

  void changeLocale({
    required Locale locale,
  }) {
    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }

  void kickedOff() {
    emit(
      state.copyWith(
        kickedOff: true,
      ),
    );
  }

  void toggleTheme() {
    emit(
      state.copyWith(
        themeMode: isLight ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
