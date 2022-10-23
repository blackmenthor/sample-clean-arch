import 'package:flutter_clean_arch/app/app.dart';
import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fakes/fake_app_cubit.dart';
import '../../../helpers/localizations_helper.dart';

void main() {

  final fakeAppCubit = FakeAppCubit();

  group('BaseException tests', () {

    setUpAll(() {
      locator.allowReassignment = true;
      locator.registerSingleton<AppCubit>(fakeAppCubit);
    });

    test('NoInternetException test', () {
      final exception = NoInternetException();
      final toString = exception.userFriendlyMessage;
      expect(toString, testLocalizations.noInternetErrorMessage);
    });

    test('ApiException test', () {
      final exception = ApiException(error: Exception(), statusCode: 400);
      final toString = exception.userFriendlyMessage;
      expect(toString, testLocalizations.responseBadRequest);
    });

  });

}