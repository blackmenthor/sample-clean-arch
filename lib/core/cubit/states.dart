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
    this.count = 0,
    this.next,
    this.previous,
    this.error,
    this.isLoadingMoreData = false,
  });

  final List<T>? data;
  final String? next;
  final String? previous;
  final int count;
  final dynamic error;
  final bool isLoadingMoreData;

  // if there's an error while loading more, we'll stop loading more
  bool get hasMore => error == null && next != null;

  BasePaginatedCubitLoadedState<T> copyWith({
    List<T>? data,
    int? count,
    String? next,
    String? previous,
    dynamic error,
    bool? isLoadingMoreData,
  }) {
    return BasePaginatedCubitLoadedState<T>(
      data: data ?? this.data,
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      error: error ?? this.error,
      isLoadingMoreData: isLoadingMoreData ?? this.isLoadingMoreData,
    );
  }
}
