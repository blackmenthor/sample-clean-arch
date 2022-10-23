import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/mocks/mock_shared_preferences.dart';

void main() {

  final mockSharedPreferences = MockSharedPreferences();
  const token = 'TOKEN';

  group('Prefs test', () {

    setUpAll(() {
      locator.allowReassignment = true;
      locator.registerSingletonAsync<SharedPreferences>(()
        => Future.value(mockSharedPreferences));
    });

    test('getToken test if null', () async {
      final prefs = PrefsService();
      await prefs.init();
      final token = prefs.getToken();
      expect(token, null);
    });

    test('getToken test if not null', () async {
      when(() => mockSharedPreferences.getString(any())).thenReturn(token);
      final prefs = PrefsService();
      await prefs.init();
      final getToken = prefs.getToken();
      expect(getToken, token);
    });

  });

}