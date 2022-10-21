import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/clean_localizations_en.dart';

enum SnackBarType {
  regular,
  error,
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark => MediaQuery.of(this).platformBrightness
        == Brightness.dark;
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  CleanLocalizations get l10n {
    try {
      return CleanLocalizations.of(this);
    } catch (ex) {
      return CleanLocalizationsEn();
    }
  }

  void showSnackbar({
    SnackBarType type = SnackBarType.regular,
    required String message,
  }) {
    var color = colors.secondary;
    var textColor = colors.primary;
    switch (type) {
      case SnackBarType.regular:
        color = colors.secondary;
        textColor = colors.primary;
        break;
      case SnackBarType.error:
        color = colors.error;
        textColor = colors.primary;
        break;
    }
    final snackbar = SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
          ),
        ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackbar);
  }
}
