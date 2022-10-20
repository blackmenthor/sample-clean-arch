import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';

export 'package:flutter_gen/gen_l10n/clean_localizations.dart';
import 'package:flutter_gen/gen_l10n/clean_localizations_en.dart';

CleanLocalizations getLocalizations() {
  final locale = locator.get<AppCubit>().locale;
  Locale? local;
  if (locale == null) {
    local = Locale(Platform.localeName);
  } else {
    local = locale;
  }

  final localeSupported = CleanLocalizations.supportedLocales.contains(local);

  if (!localeSupported) return CleanLocalizationsEn();

  return lookupCleanLocalizations(local!);
}
