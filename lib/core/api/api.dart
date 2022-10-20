import 'package:flutter_clean_arch/core/models/credentials.dart';
import 'package:flutter_clean_arch/domain/auth/api/user_api.dart';
import 'package:flutter_clean_arch/domain/journal/api/journal_api.dart';

export 'base/base_api.dart';
export 'base/base_exception.dart';
export 'base/base_request_info.dart';
export 'models/request_object.dart';
export 'models/response_object.dart';

class Api {
  Api._({
      required this.journalApi,
      required this.authApi,
  });

  factory Api.create({
    required Credentials credentials,
  }) {
    return Api._(
      authApi: AuthApi(
        baseEndpoint: credentials.baseEndpoint,
      ),
      journalApi: JournalApi(
        baseEndpoint: credentials.baseEndpoint,
      ),
    );
  }

  final JournalApi journalApi;
  final AuthApi authApi;

  JournalApi get journal => journalApi;
  AuthApi get auth => authApi;
}
