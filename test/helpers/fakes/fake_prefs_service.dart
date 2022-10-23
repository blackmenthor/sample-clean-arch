import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePrefsService extends Fake implements PrefsService {
  FakePrefsService({
      this.fakeToken,
  });

  final String? fakeToken;

  @override
  bool get isLoggedIn => fakeToken != null;

  @override
  String? getToken() {
    return fakeToken;
  }
}