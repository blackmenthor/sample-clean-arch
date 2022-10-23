import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';
import 'package:flutter_test/flutter_test.dart';

final testAppLogger = AppLogger();

Future<void> setupFakes() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  locator.allowReassignment = true;
  locator.registerSingleton<AppLogger>(testAppLogger);
}