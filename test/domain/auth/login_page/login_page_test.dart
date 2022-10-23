import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/view/login_page.dart';
import 'package:flutter_clean_arch/domain/auth/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/mocks/mock_auth_repository.dart';
import '../../../helpers/setup_fakes.dart';
import '../../../helpers/ui_helper.dart';

void main() {

  final mockAuthRepository = MockAuthRepository();

  group('Login page tests', () {
    setUpAll(() async {
      await setupFakes();
      locator.registerSingleton<AuthRepository>(mockAuthRepository);
    });

    testWidgets('Login page golden tests', (tester) async {
      await tester.pumpWidget(
        const LoginPage()
          .wrapWithScaffold()
          .wrapWithMaterialApp(),
      );
      await tester.pumpAndSettle();
      
      await expectLater(find.byType(LoginPage),
        matchesGoldenFile('login_page_golden.png'));
    });

    testWidgets('Login page matches text', (tester) async {
      await tester.pumpWidget(
        const LoginPage()
            .wrapWithScaffold()
            .wrapWithMaterialApp(),
      );
      await tester.pumpAndSettle();

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.textContaining('Register here'), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('Login page button should be disabled the first time', (tester) async {
      await tester.pumpWidget(
        const LoginPage()
            .wrapWithScaffold()
            .wrapWithMaterialApp(),
      );
      await tester.pumpAndSettle();

      final btn = find.byKey(const ValueKey('login_btn')).evaluate().first.widget as MaterialButton;
      expect(btn.onPressed, null);
    });
  });

}