import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAppCubit extends Fake implements AppCubit {
  FakeAppCubit({
      this.fakeLocale = const Locale('en'),
  });

  final Locale fakeLocale;

  @override
  Locale get locale => fakeLocale;

}