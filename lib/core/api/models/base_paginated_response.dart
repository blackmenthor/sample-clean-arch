import 'package:flutter_clean_arch/core/api/models/paginated_date.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';

class BasePaginatedResponse<T extends ResponseObject> {
  BasePaginatedResponse({
    this.paginatedDate,
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  final PaginatedDate? paginatedDate;
  final int page;
  final int totalPages;
  final int totalResults;
  final List<T> results;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'paginated_date':
            paginatedDate == null ? null : paginatedDate!.toJson(),
        'page': page,
        'total_pages': totalPages,
        'total_results': totalResults,
        'results': results.isEmpty ? [] : results,
      };
}
