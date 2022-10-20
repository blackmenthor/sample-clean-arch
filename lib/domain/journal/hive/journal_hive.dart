import 'package:flutter_clean_arch/core/hive/base_hive_box.dart';
import 'package:flutter_clean_arch/core/hive/base_hive_model.dart';
import 'package:flutter_clean_arch/domain/journal/hive/journal_box.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JournalHive extends BaseHiveModel<Journal> {
  @override
  Future<BaseHiveBox<Journal>> initBox() async {
    final movieBox = JournalBox();
    await movieBox.init();
    return movieBox;
  }

  @override
  void registerAdapters() {
    Hive
      .registerAdapter<Journal>(JournalDataAdapter());
  }
}
