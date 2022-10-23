import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/domain/journal/api/journal_api.dart';
import 'package:mocktail/mocktail.dart';

class FakeApi extends Fake implements Api {
  FakeApi({this.fakeJournalApi});

  final JournalApi? fakeJournalApi;

  @override
  JournalApi get journal => fakeJournalApi ?? JournalApi(baseEndpoint: '');

  @override
  JournalApi get journalApi => fakeJournalApi ?? JournalApi(baseEndpoint: '');
}