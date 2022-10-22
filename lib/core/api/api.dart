import 'package:flutter_clean_arch/core/models/credentials.dart';
import 'package:flutter_clean_arch/domain/journal/api/journal_api.dart';

export 'base/base_api.dart';
export 'base/base_exception.dart';
export 'base/base_request_info.dart';
export 'models/response_object.dart';

class Api {
  Api._({
      required this.journalApi,
  });

  factory Api.create({
    required Credentials credentials,
  }) {
    return Api._(
      journalApi: JournalApi(
        baseEndpoint: credentials.baseEndpoint,
      ),
    );
  }

  final JournalApi journalApi;

  JournalApi get journal => journalApi;
}
