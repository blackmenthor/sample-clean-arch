import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/utils/logger/console_logger.dart';

abstract class BaseLogger {

  void i({
    required String message,
  });

  void d({
    required String message,
  });

  void v({
    required String message,
  });

  void e({
    required dynamic error,
    required StackTrace stackTrace,
  });

}

class AppLogger {

  final loggers = <BaseLogger>[
    ConsoleLogger(),
  ];

  void i({
    required String message,
  }) => loggers.forEach((e) => e.i(message: message));

  void d({
    required String message,
  }) => loggers.forEach((e) => e.d(message: message));

  void v({
    required String message,
  }) => loggers.forEach((e) => e.v(message: message));

  void e({
    required dynamic error,
    required StackTrace stackTrace,
  }) => loggers.forEach((e) => e.e(error: error, stackTrace: stackTrace));

}

final logger = locator<AppLogger>();
