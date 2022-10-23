import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

extension WidgetTestExt on Widget {

  Widget wrapWithMaterialApp() {
    return MaterialApp(
      localizationsDelegates: const [
        CleanLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: CleanLocalizations.supportedLocales,
      home: this,
    );
  }

  Widget wrapWithScaffold() {
    return Scaffold(
      body: this,
    );
  }
}