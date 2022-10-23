import 'package:flutter_clean_arch/core/api/base/base_api.dart';
import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';

class JournalApi extends BaseApi<Journal> {
  JournalApi({
    required String baseEndpoint,
  }) : super(
          baseEndpoint: baseEndpoint,
          serializer: Journal.serializer,
        );

  Future<BasePaginatedResponse<Journal>> getJournals({
    int page = 1,
  }) async {
    return getList(
      path: 'journal/journal/',
      queryParams: {
        'page': page,
      },
    );
  }

  Future<Journal> getJournal({
    required String id
  }) async {
    return get(
      path: 'journal/journal/$id/',
    );
  }
}
