abstract class AppException implements Exception {

  dynamic get originalError;
  String get userFriendlyMessage;

}

class DefaultAppException extends AppException {

  @override
  dynamic get originalError => Exception(userFriendlyMessage);

  @override
  String get userFriendlyMessage => "There's an error while fetching the resources.";

}
