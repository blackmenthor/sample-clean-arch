import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';

class JournalListCubitErrorState extends BaseCubitErrorState {
  JournalListCubitErrorState({
    required AppException error,
    this.searchQuery,
  }) : super(error: error);

  final String? searchQuery;

  JournalListCubitErrorState copyWith({
    String? searchQuery,
    AppException? error,
  }) {
    return JournalListCubitErrorState(
      searchQuery: searchQuery ?? this.searchQuery,
      error: error ?? this.error,
    );
  }
}

class JournalListCubitLoadingState extends BaseCubitLoadingState {
  JournalListCubitLoadingState({
    this.searchQuery,
  });

  final String? searchQuery;

  JournalListCubitLoadingState copyWith({
    String? searchQuery,
  }) {
    return JournalListCubitLoadingState(
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class JournalListCubitLoadedState extends BasePaginatedCubitLoadedState<Journal> {
  JournalListCubitLoadedState({
    required List<Journal>? data,
    required int count,
    required String? next,
    required String? previous,
    dynamic error,
    required bool isLoadingMoreData,
    this.searchQuery,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          data: data,
          error: error,
          isLoadingMoreData: isLoadingMoreData,
        );

  final String? searchQuery;

  List<Journal>? get filteredData {
    if (data?.isEmpty ?? true) return data;

    final query = searchQuery?.toLowerCase() ?? '';
    if (query.isEmpty) return data;

    final filtered = data!
        .where((movie) => movie.title.toLowerCase().contains(query))
        .toList();
    return filtered;
  }

  @override
  JournalListCubitLoadedState copyWith({
    List<Journal>? data,
    int? count,
    String? next,
    String? previous,
    dynamic error,
    String? searchQuery,
    bool? isLoadingMoreData,
  }) {
    return JournalListCubitLoadedState(
      data: data ?? this.data,
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      error: error ?? this.error,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoadingMoreData: isLoadingMoreData ?? this.isLoadingMoreData,
    );
  }
}
