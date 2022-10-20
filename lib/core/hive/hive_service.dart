import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/hive/base_hive_box.dart';
import 'package:flutter_clean_arch/domain/journal/hive/journal_hive.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final hiveInstance = locator<HiveService>();

final hiveBoxNames = <Type, String>{
  Journal: 'Journal',
};

class HiveService {
  ValueNotifier<bool> initializedNotifier = ValueNotifier(false);
  Map<String, BaseHiveBox> boxes = {};

  Future<String> get path async {
    final dir = await getApplicationSupportDirectory();
    return dir.path;
  }

  Future<void> init() async {
    initializedNotifier.value = false;
    final dbPath = await path;
    Hive.init(dbPath);
    _registerAdapters();
    await _initializeBoxes();
    initializedNotifier.value = true;
  }

  // add more Hive impl. here
  void _registerAdapters() {
    JournalHive().registerAdapters();
  }

  // add more Hive boxes here
  Future<void> _initializeBoxes() async {
    final journalBox = await JournalHive().initBox();
    boxes['Journal'] = journalBox;
  }
}
