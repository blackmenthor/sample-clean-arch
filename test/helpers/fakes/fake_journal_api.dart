import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/journal/api/journal_api.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:mocktail/mocktail.dart';

class FakeJournalApi extends Fake implements JournalApi {
  FakeJournalApi({
      this.fakeJournal,
      this.fakeJournals,
  });

  final Journal? fakeJournal;
  final List<Journal>? fakeJournals;

  Future<BasePaginatedResponse<Journal>> getJournals({
    int page = 1,
  }) async {
    if (fakeJournals == null) throw DefaultAppException();
    return BasePaginatedResponse(
        count: fakeJournals!.length,
        next: '',
        previous: '',
        results: fakeJournals!,
    );
  }

  @override
  Future<Journal> getJournal({
    required String id
  }) async {
    if (fakeJournal == null) throw DefaultAppException();
    return fakeJournal!;
  }

}