import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDio extends Fake implements Dio {
  FakeDio({
      this.statusCode = 200,
      required this.response,
  });

  final int statusCode;
  final dynamic response;

  @override
  Future<Response<T>> get<T>(
      String path,
      {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }
  ) async {
    return Response<T>(
        statusCode: 200,
        requestOptions: RequestOptions(
          path: path,
        ),
        data: response,
    );
  }

  @override
  Future<Response<T>> post<T>(
      String path,
      {
        data, Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }
  ) async {
    return Response<T>(
      statusCode: 200,
      requestOptions: RequestOptions(
        path: path,
      ),
      data: response,
    );
  }

  @override
  Future<Response<T>> put<T>(
      String path,
      {
        data, Map<String, dynamic>? queryParameters,
        Options? options, CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }
  ) async {
    return Response<T>(
      statusCode: 200,
      requestOptions: RequestOptions(
        path: path,
      ),
      data: response,
    );
  }

}