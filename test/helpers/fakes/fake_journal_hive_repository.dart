import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_hive_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeJournalHiveRepository extends Fake implements JournalHiveRepository {
  FakeJournalHiveRepository({
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

  @override
  Future<Journal> updateItem({required Journal updatedItem, required String id, Journal? oldItem}) async {
    if (fakeJournal == null) throw DefaultAppException();
    return fakeJournal!;
  }

}