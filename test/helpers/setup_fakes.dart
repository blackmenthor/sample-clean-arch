import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

final testAppLogger = AppLogger();

void setupFakes() {
  locator.allowReassignment = true;
  locator.registerSingleton<AppLogger>(testAppLogger);
}