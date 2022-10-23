import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeJournalApiRepository extends Fake implements JournalAPIRepository {
  FakeJournalApiRepository({
    this.fakeJournal,
    this.fakeJournals,
  });

  final Journal? fakeJournal;
  final List<Journal>? fakeJournals;

  @override
  Future<BasePaginatedResponse<Journal>> getItems({
    required int page,
  }) async {
    if (fakeJournals == null) throw DefaultAppException();
    return BasePaginatedResponse(
      count: fakeJournals!.length,
      next: null,
      previous: null,
      results: fakeJournals!,
    );
  }

  @override
  Future<Journal> getSingle({required String id}) async {
    if (fakeJournal == null) throw DefaultAppException();
    return fakeJournal!;
  }

}