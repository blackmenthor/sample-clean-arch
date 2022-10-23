import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  const path = '/login';
  const username = 'USERNAME';
  const body = <String, dynamic>{
    'username': username,
  };

  group('BaseApiRequestInfo test', () {
    test('toString test', () {
      final requestInfo = BaseApiRequestInfo(
          type: BaseApiRequestType.post,
          body: body,
          path: path,
      );
      final toString = requestInfo.toString();
      assert(toString.contains('POST: /login'));
      assert(!toString.contains('Query'));
      assert(!toString.contains('Headers'));
      assert(toString.contains('Body: $body'));
    });
  });

}