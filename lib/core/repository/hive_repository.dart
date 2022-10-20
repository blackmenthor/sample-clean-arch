import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:flutter_clean_arch/core/hive/base_hive_box.dart';
import 'package:flutter_clean_arch/core/hive/hive_service.dart';
import 'package:flutter_clean_arch/core/repository/base_repository.dart';

abstract class HiveRepository<T extends ResponseObject>
    implements BaseRepository<T> {
  final hiveService = hiveInstance;
  BaseHiveBox<T> get _box {
    return hiveService.boxes[hiveBoxNames[T]]! as BaseHiveBox<T>;
  }

  bool get closed => _box.closed;

  @override
  Future<T> addNew({
    required T item,
    required String id,
  }) async {
    await _box.putItem(id: id, item: item);
    return item;
  }

  @override
  Future<void> deleteItem({
    required String id,
  }) async {
    await _box.deleteItem(id: id);
  }

  @override
  Future<BasePaginatedResponse<T>> getItems({
    required int page,
  }) async {
    final resp = _box.getAll();
    return Future.value(
      BasePaginatedResponse(
        totalResults: resp?.length ?? 0,
        totalPages: 1,
        page: 1,
        results: resp ?? [],
      ),
    );
  }

  @override
  Future<T> getSingle({
    required String id,
  }) {
    final resp = _box.getSingle(id: id);
    return Future.value(resp);
  }

  @override
  Future<T> updateItem({
    required T updatedItem,
    required String id,
    T? oldItem,
  }) async {
    await _box.putItem(id: id, item: updatedItem);
    return updatedItem;
  }
}
