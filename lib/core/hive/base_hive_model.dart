import 'package:flutter_clean_arch/core/hive/base_hive_box.dart';
import 'package:flutter_clean_arch/core/models/base_model.dart';

abstract class BaseHiveModel<T extends BaseModel> {
  void registerAdapters();

  Future<BaseHiveBox<T>> initBox();
}
