

import 'package:flutter_clean_arch/core/api/models/paginated_date.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';

abstract class BaseCubitState {}

class BaseCubitIdleState extends BaseCubitState {}

class BaseCubitLoadingState extends BaseCubitState {}

class BaseCubitErrorState extends BaseCubitState {
  BaseCubitErrorState({
    required this.error,
  });

  final AppException error;

  BaseCubitErrorState copyWith({
    AppException? error,
  }) {
    return BaseCubitErrorState(
      error: error ?? this.error,
    );
  }
}

class BaseCubitLoadedState<T> extends BaseCubitState {
  BaseCubitLoadedState({
    required this.data,
  });

  final T? data;

  BaseCubitLoadedState<T> copyWith({
    T? data,
  }) {
    return BaseCubitLoadedState<T>(
      data: data ?? this.data,
    );
  }
}

class BasePaginatedCubitLoadedState<T> extends BaseCubitState {
  BasePaginatedCubitLoadedState({
    required this.data,
    this.paginatedDate,
    this.page = 1,
    this.totalPages = 1,
    this.totalResults = 0,
    this.error,
    this.isLoadingMoreData = false,
  });

  final List<T>? data;
  final PaginatedDate? paginatedDate;
  final int page;
  final int totalPages;
  final int totalResults;
  final dynamic error;
  final bool isLoadingMoreData;

  // if there's an error while loading more, we'll stop loading more
  bool get hasMore => error == null && page < totalPages;

  BasePaginatedCubitLoadedState<T> copyWith({
    List<T>? data,
    PaginatedDate? paginatedDate,
    int? page,
    int? totalPages,
    int? totalResults,
    dynamic error,
    bool? isLoadingMoreData,
  }) {
    return BasePaginatedCubitLoadedState<T>(
      data: data ?? this.data,
      paginatedDate: paginatedDate ?? this.paginatedDate,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      error: error ?? this.error,
      isLoadingMoreData: isLoadingMoreData ?? this.isLoadingMoreData,
    );
  }
}
