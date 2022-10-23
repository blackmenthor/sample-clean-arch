import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/api/base/base_exception.dart';

extension ResponseExtension<T> on Response<T> {
  int get code => statusCode ?? 0;

  bool get isSuccessful => code >= 200 && code < 400;

  void checkIfCallIsSuccessful() {
    if (!isSuccessful) {
      throw ApiException(
        responseBody: data?.toString(),
        statusCode: code,
        error: Exception(code),
      );
    }
  }
}
