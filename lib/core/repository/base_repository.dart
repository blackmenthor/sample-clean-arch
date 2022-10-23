import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';

abstract class BaseRepository<T extends ResponseObject> {
  Future<T> getSingle({
    required String id,
  });

  Future<BasePaginatedResponse<T>> getItems({
    required int page,
  });

  Future<T> addNew({
    required T item,
    String? id,
  });

  Future<T> updateItem({
    required T updatedItem,
    required String id,
    T? oldItem,
  });

  Future<void> deleteItem({
    required String id,
  });
}
