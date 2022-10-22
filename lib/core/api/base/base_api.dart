import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/core/api/base/api_calls.dart';
import 'package:flutter_clean_arch/core/api/base/base_exception.dart';
import 'package:flutter_clean_arch/core/api/base/base_request_info.dart';
import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/extensions/response_extensions.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_clean_arch/utils/constants.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

class BaseApi<T extends ResponseObject> {
  BaseApi({
    required this.baseEndpoint,
    required this.serializer,
  });

  final prefs = locator.get<PrefsService>();
  final String baseEndpoint;
  final T Function(Map<String, dynamic>) serializer;

  // move to DI.
  final Dio dio = locator.get<Dio>();
  final Connectivity connectivity = locator.get<Connectivity>();

  Future<R> _call<R>({
    required Future<R> Function() body,
  }) async {
    // check if internet is active or not
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }

    try {
      final resp = await body();
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
    } catch (ex, trace) {
      logger.e(error: ex, stackTrace: trace);
      throw ApiException(error: ex);
    }
  }

  Future<T> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return GetApiCall<T>(
      dio: dio,
      connectivity: connectivity,
      serializer: serializer,
    ).call(
      path: resolvePath(path: path),
      queryParams: queryParams,
      headers: headers,
    );
  }

  Future<BasePaginatedResponse<T>> getList({
    required String path,
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
      type: BaseApiRequestType.getList,
      path: resolvePath(path: path),
      queryParams: queryParams,
      header: headers,
    );

    return _call<BasePaginatedResponse<T>>(
      body: () async {
        logger.i(
          message: '''
          [API] Fetching API Call
          
          $requestInfo
        ''',
        );

        final response = await dio.get<String>(
          resolvePath(path: path),
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

        final count = json['count'] as int;
        final next = json['next'] as String?;
        final previous = json['previous'] as String?;

        final results = <T>[];
        final resultsJson = json['results'] as List<dynamic>;

        for (final item in resultsJson) {
          final serializedItem = serializer(item as Map<String, Object?>);
          results.add(serializedItem);
        }

        return BasePaginatedResponse<T>(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );
      },
    );
  }

  Future<List<T>> getListWithoutPagination({
    required String path,
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
      type: BaseApiRequestType.getList,
      path: resolvePath(path: path),
      queryParams: requestParams,
      header: headers,
    );

    return _call<List<T>>(
      body: () async {
        logger.i(
          message: '''
          [API] Fetching API Call
          
          $requestInfo
        ''',
        );

        final response = await dio.get<String>(
          resolvePath(path: path),
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

        final ret = <T>[];
        final json = jsonDecode(jsonString!) as List<dynamic>;

        for (final item in json) {
          final serializedItem = serializer(item as Map<String, Object?>);
          ret.add(serializedItem);
        }

        return ret;
      },
    );
  }

  Future<T> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    return PostApiCall<T>(
      dio: dio,
      connectivity: connectivity,
      serializer: serializer,
    ).call(
      path: resolvePath(path: path),
      queryParams: queryParams,
      body: body,
      headers: headers,
    );
  }

  Future<T> put({
    required String path,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    return PutApiCall<T>(
      dio: dio,
      connectivity: connectivity,
      serializer: serializer,
    ).call(
      path: resolvePath(path: path),
      queryParams: queryParams,
      body: body,
      headers: headers,
    );
  }

  Future<T> delete({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    return DeleteApiCall<T>(
      dio: dio,
      connectivity: connectivity,
      serializer: serializer,
    ).call(
      path: resolvePath(path: path),
      queryParams: queryParams,
      headers: headers,
    );
  }

  String resolvePath({
    required String path,
  }) =>
      baseEndpoint + path;

  Map<String, dynamic> get defaultHeaders {
    final headers = <String, dynamic>{
      Constants.contentTypeHeaderKey: Constants.contentTypeHeaderValue,
    };

    if (prefs.isLoggedIn) {
      headers[Constants.authHeaderKey] = '${Constants.authHeaderValuePrefix} '
          '${prefs.getToken()}';
    }

    return headers;
  }

  Map<String, dynamic> get defaultQueryParams {
    final headers = <String, dynamic>{};

    return headers;
  }
}
