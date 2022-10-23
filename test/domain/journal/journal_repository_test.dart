import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_api_repository.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_hive_repository.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/data/journal_data.dart';
import '../../helpers/fakes/fake_journal_api_repository.dart';
import '../../helpers/fakes/fake_journal_hive_repository.dart';
import '../../helpers/setup_fakes.dart';

void main() {

  group('JournalRepository tests', () {

    setUpAll(() {
      setupFakes();
    });

    test('getSingle api call success', () async {
      final journalApiRepository = FakeJournalApiRepository(
        fakeJournal: journalTest1,
      );
      final journalHiveRepository = FakeJournalHiveRepository(
        fakeJournal: journalTest1,
      );
      locator.registerSingleton<JournalAPIRepository>(journalApiRepository);
      locator.registerSingleton<JournalHiveRepository>(journalHiveRepository);

      final repository = JournalRepository();
      final resp = await repository.getSingle(id: 'ID');
      expect(resp, journalTest1);
    });

  });

}