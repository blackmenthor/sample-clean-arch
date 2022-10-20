import 'package:flutter_clean_arch/utils/logger/logger.dart';
import 'package:logger/logger.dart';

class ConsoleLogger extends BaseLogger {

  final _logger = Logger();

  @override
  void d({required String message}) => _logger.d(message);

  @override
  void e({
    required dynamic error,
    required StackTrace stackTrace,
  }) => _logger.e(
      error.toString(),
      error,
      stackTrace
  );

  @override
  void i({required String message}) => _logger.i(message);

  @override
  void v({required String message}) => _logger.v(message);

}