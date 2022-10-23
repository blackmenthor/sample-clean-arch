import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/repository/fetch_only_repository.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_api_repository.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_hive_repository.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

class JournalRepository extends FetchOnlyRepository<Journal> {
  final cacheSource = locator.get<JournalHiveRepository>();
  final remoteSource = locator.get<JournalAPIRepository>();

  @override
  Future<BasePaginatedResponse<Journal>> getItems({
    required int page,
  }) async {
    try {
      final paginatedResponse = await remoteSource.getItems(
        page: page,
      );

      final results = paginatedResponse.results;

      for (final item in results) {
        await cacheSource.addNew(item: item, id: item.id);
      }
      return paginatedResponse;
    } catch (ex, trace) {
      logger.e(error: ex, stackTrace: trace);
      // if paginated items is loaded, don't load more data from cache
      if (page > 1) {
        rethrow;
      }
      final cachedItems = await cacheSource.getItems(page: page);
      if (cachedItems.results.isNotEmpty) {
        return cachedItems;
      }
      rethrow;
    }
  }

  @override
  Future<Journal> getSingle({required String id}) async {
    try {
      final resp = await remoteSource.getSingle(id: id);
      await cacheSource.updateItem(updatedItem: resp, id: id);
      return resp;
    } catch (ex, trace) {
      logger.e(error: ex, stackTrace: trace);
      final cachedItems = await cacheSource.getSingle(id: id);
      if (cachedItems != null) {
        return cachedItems;
      }
      rethrow;
    }
  }
}
