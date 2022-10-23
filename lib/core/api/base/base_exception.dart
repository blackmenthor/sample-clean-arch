import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';

class ApiException extends AppException {
  ApiException({
    this.statusCode,
    this.responseBody,
    required this.error,
  });

  final int? statusCode;
  final String? responseBody;
  final dynamic error;

  @override
  dynamic get originalError => error;

  @override
  String get userFriendlyMessage {
    final localizations = getLocalizations();
    switch (statusCode) {
      case 404:
        return localizations.responseNotFound;
      case 400:
        return localizations.responseBadRequest;
      case 500:
      case 502:
      case 503:
        return localizations.systemNotAvailable;
      default:
        return localizations.defaultErrorMessage;
    }
  }
}

class ApiCallException {}

class NoInternetException extends ApiException {
  NoInternetException()
      : super(
          statusCode: -1,
          responseBody: null,
          error: Exception("You're not connected to internet"),
        );

  @override
  dynamic get originalError => error;

  @override
  String get userFriendlyMessage {
    final localizations = getLocalizations();
    return localizations.noInternetErrorMessage;
  }
}
