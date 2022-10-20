import 'package:flutter_clean_arch/core/cubit/base_loadable_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_repository.dart';

class JournalDetailCubit extends BaseLoadableCubit<Journal> {
  JournalDetailCubit({
    required this.id,
  });

  final String id;

  final journalRepository = locator.get<JournalRepository>();

  @override
  Future<Journal> loadData() {
    return journalRepository.getSingle(id: id);
  }
}
