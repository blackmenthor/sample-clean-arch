import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/repository/fetch_only_repository.dart';
import 'package:flutter_clean_arch/domain/journal/api/journal_api.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';

class JournalAPIRepository extends FetchOnlyRepository<Journal> {
  final api = locator.get<Api>();

  JournalApi get journalApi => api.journal;

  @override
  Future<BasePaginatedResponse<Journal>> getItems({
    required int page,
  }) async {
    return journalApi.getJournals(
      page: page,
    );
  }

  @override
  Future<Journal> getSingle({required String id}) {
    return journalApi.getJournal(id: id);
  }
}
