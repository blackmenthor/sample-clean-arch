import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:flutter_clean_arch/core/repository/base_repository.dart';

abstract class FetchOnlyRepository<T extends ResponseObject>
    extends BaseRepository<T> {
  @override
  Future<T> addNew({required T item, String? id}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<T> updateItem({required T updatedItem, required String id, T? oldItem}) {
    throw UnimplementedError();
  }
}
