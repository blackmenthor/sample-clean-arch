import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  CleanLocalizations get l10n => CleanLocalizations.of(this);
}
