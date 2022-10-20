import 'package:flutter_clean_arch/core/api/models/response_object.dart';

class BasePaginatedResponse<T extends ResponseObject> {
  BasePaginatedResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'next': next,
        'previous': previous,
        'results': results.isEmpty ? [] : results,
      };
}
