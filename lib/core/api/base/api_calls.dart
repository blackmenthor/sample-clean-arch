import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/api/base/base_exception.dart';
import 'package:flutter_clean_arch/core/api/base/base_request_info.dart';
import 'package:flutter_clean_arch/core/extensions/response_extensions.dart';
import 'package:flutter_clean_arch/utils/constants.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

enum BaseApiCallType {
  get,
  getList,
  getListWithoutPagination,
  post,
  put,
  delete
}

abstract class BaseApiCall<T> {
  BaseApiCall({
    required this.type,
    required this.dio,
    required this.connectivity,
    required this.serializer,
  });

  final BaseApiCallType type;
  final Dio dio;
  final Connectivity connectivity;
  final T Function(Map<String, dynamic>) serializer;

  Map<String, dynamic> get defaultHeaders {
    final headers = <String, dynamic>{
      Constants.contentTypeHeaderKey: Constants.contentTypeHeaderValue,
    };

    // fill in auth headers here if needed

    return headers;
  }

  Map<String, dynamic> get defaultQueryParams {
    final headers = <String, dynamic>{};

    return headers;
  }

  Future<void> _checkForConnectivity() async {
    // check if internet is active or not
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
  }

  Future<T> actualApiCall({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });

  Future<T> call({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    await _checkForConnectivity();

    try {
      final resp = await actualApiCall(
          path: path,
          body: body,
          queryParams: queryParams,
          headers: headers,
      );
      return resp;
    } on DioError catch (ex) {
      // change to extension function

      throw ApiException(
        statusCode: ex.response?.statusCode ?? 400,
        responseBody: ex.response?.data?.toString(),
        error: ex,
      );
    } on NoInternetException catch (_) {
      rethrow;
    } catch (ex) {
      throw ApiException(error: ex);
    }
  }
}

class GetApiCall<T> extends BaseApiCall<T> {
  GetApiCall({
    required Dio dio,
    required Connectivity connectivity,
    required T Function(Map<String, dynamic> p1) serializer,
  }) : super(
          type: BaseApiCallType.get,
          dio: dio,
          connectivity: connectivity,
          serializer: serializer,
        );

  @override
  Future<T> actualApiCall({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }
    final requestParams = defaultQueryParams;
    if (queryParams?.isNotEmpty ?? false) {
      requestParams.addAll(queryParams!);
    }

    final requestInfo = BaseApiRequestInfo(
      type: BaseApiRequestType.get,
      path: path,
      queryParams: queryParams,
      header: headers,
    );

    logger.i(
      message: '''
          [API] Fetching API Call
          $requestInfo
        ''',
    );

    final response = await dio.get<String>(
      path,
      queryParameters: requestParams,
      options: Options(
        headers: requestHeaders,
      ),
    );
    logger.i(
      message: '''
          [API] API call results
          $requestInfo
          
          Response: ${response.data}
        ''',
    );
    response.checkIfCallIsSuccessful();

    final jsonString = response.data?.toString();
    final json = jsonDecode(jsonString!) as Map<String, dynamic>;

    return serializer(json);
  }
}

class PostApiCall<T> extends BaseApiCall<T> {
  PostApiCall({
    required Dio dio,
    required Connectivity connectivity,
    required T Function(Map<String, dynamic> p1) serializer,
  }) : super(
          type: BaseApiCallType.post,
          dio: dio,
          connectivity: connectivity,
          serializer: serializer,
        );

  @override
  Future<T> actualApiCall({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }
    final requestParams = defaultQueryParams;
    if (queryParams?.isNotEmpty ?? false) {
      requestParams.addAll(queryParams!);
    }

    final requestInfo = BaseApiRequestInfo(
      type: BaseApiRequestType.post,
      path: path,
      queryParams: queryParams,
      header: headers,
      body: body,
    );

    logger.i(
      message: '''
          [API] Fetching API Call
          
          $requestInfo
        ''',
    );

    final response = await dio.post<String>(
      path,
      queryParameters: requestParams,
      data: body,
      options: Options(
        headers: requestHeaders,
      ),
    );
    logger.i(
      message: '''
          [API] API call results
          
          $requestInfo
          
          Response: ${response.data}
        ''',
    );
    response.checkIfCallIsSuccessful();

    final jsonString = response.data?.toString();
    final json = jsonDecode(jsonString!) as Map<String, dynamic>;

    return serializer(json);
  }
}

class PutApiCall<T> extends BaseApiCall<T> {
  PutApiCall({
    required Dio dio,
    required Connectivity connectivity,
    required T Function(Map<String, dynamic> p1) serializer,
  }) : super(
          type: BaseApiCallType.put,
          dio: dio,
          connectivity: connectivity,
          serializer: serializer,
        );

  @override
  Future<T> actualApiCall({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }
    final requestParams = defaultQueryParams;
    if (queryParams?.isNotEmpty ?? false) {
      requestParams.addAll(queryParams!);
    }

    final requestInfo = BaseApiRequestInfo(
      type: BaseApiRequestType.put,
      path: path,
      queryParams: queryParams,
      header: headers,
    );

    logger.i(
      message: '''
          [API] Fetching API Call
          
          $requestInfo
        ''',
    );

    final response = await dio.put<String>(
      path,
      queryParameters: queryParams,
      data: body,
      options: Options(
        headers: requestHeaders,
      ),
    );
    logger.i(
      message: '''
          [API] API call results
          
          $requestInfo
          
          Response: ${response.data}
        ''',
    );
    response.checkIfCallIsSuccessful();

    final jsonString = response.data?.toString();
    final json = jsonDecode(jsonString!) as Map<String, dynamic>;

    return serializer(json);
  }
}

class DeleteApiCall<T> extends BaseApiCall<T> {
  DeleteApiCall({
    required Dio dio,
    required Connectivity connectivity,
    required T Function(Map<String, dynamic> p1) serializer,
  }) : super(
          type: BaseApiCallType.delete,
          dio: dio,
          connectivity: connectivity,
          serializer: serializer,
        );

  @override
  Future<T> actualApiCall({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    final requestHeaders = defaultHeaders;
    if (headers?.isNotEmpty ?? false) {
      requestHeaders.addAll(headers!);
    }
    final requestParams = defaultQueryParams;
    if (queryParams?.isNotEmpty ?? false) {
      requestParams.addAll(queryParams!);
    }

    final requestInfo = BaseApiRequestInfo(
      type: BaseApiRequestType.delete,
      path: path,
      queryParams: queryParams,
      header: headers,
    );

    logger.i(
      message: '''
          [API] Fetching API Call
          
          $requestInfo
        ''',
    );

    final response = await dio.delete<String>(
      path,
      queryParameters: queryParams,
      options: Options(
        headers: requestHeaders,
      ),
    );

    logger.i(
      message: '''
          [API] API call results
          
          $requestInfo
          
          Response: ${response.data}
        ''',
    );
    response.checkIfCallIsSuccessful();

    final jsonString = response.data?.toString();
    final json = jsonDecode(jsonString!) as Map<String, dynamic>;

    return serializer(json);
  }
}
