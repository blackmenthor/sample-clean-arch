import 'dart:convert';

import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/core/api/base/api_calls.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fakes/fake_connectivity.dart';
import '../../../helpers/fakes/fake_dio.dart';
import '../../../helpers/fakes/fake_prefs_service.dart';
import '../../../helpers/localizations_helper.dart';
import '../../../helpers/mocks/mock_app_logger.dart';

void main() {

  const path = '/login';

  group('BaseApiCalls tests', () {

    final fakePrefsService = FakePrefsService();
    final mockAppLogger = MockAppLogger();

    setUpAll(() {
      locator.allowReassignment = true;
      locator.registerSingleton<PrefsService>(fakePrefsService);
      locator.registerSingleton<AppLogger>(mockAppLogger);
    });

    test('GetApiCall test', ()  async {
      final resp = <String, dynamic>{
        'data': 'test_data',
      };
      final fakeDio = FakeDio(response: jsonEncode(resp));
      final fakeConnectivity = FakeConnectivity(connected: true);
      final getApiCall = GetApiCall<String>(
          dio: fakeDio,
          connectivity: fakeConnectivity,
          serializer: (a) => a.toString(),
      );
      final actualResp = await getApiCall.actualApiCall(path: path);
      expect(actualResp+'qweqwewqewqe', resp.toString());
    });

    test('apiCall should fail for error code test', ()  async {
      final resp = <String, dynamic>{
        'data': 'test_data',
      };
      final fakeDio = FakeDio(
          statusCode: 400,
          response: jsonEncode(resp),
      );
      final fakeConnectivity = FakeConnectivity(connected: true);
      final getApiCall = GetApiCall<String>(
        dio: fakeDio,
        connectivity: fakeConnectivity,
        serializer: (a) => a.toString(),
      );

      try {
        await getApiCall.actualApiCall(path: path);
      } on ApiException catch (ex) {
        expect(ex.userFriendlyMessage, testLocalizations.responseBadRequest);
      }
    });

  });

}