import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/cubit/base_paginated_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/cubit/journal_list_cubit_state.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_repository.dart';

class JournalListCubit extends BasePaginatedCubit<Journal> {
  final journalRepository = locator.get<JournalRepository>();

  String? get currentQuery {
    String? prevQuery;
    if (state is JournalListCubitLoadingState) {
      prevQuery = (state as JournalListCubitLoadingState).searchQuery;
    } else if (state is JournalListCubitErrorState) {
      prevQuery = (state as JournalListCubitErrorState).searchQuery;
    } else if (state is JournalListCubitLoadedState) {
      prevQuery = (state as JournalListCubitLoadedState).searchQuery;
    }
    return prevQuery;
  }

  void searchItem({
    required String query,
  }) {
    if (state is JournalListCubitLoadingState) {
      emit(
        (state as JournalListCubitLoadingState).copyWith(
          searchQuery: query,
        ),
      );
    } else if (state is JournalListCubitErrorState) {
      emit(
        (state as JournalListCubitErrorState).copyWith(
          searchQuery: query,
        ),
      );
    } else {
      emit(
        (state as JournalListCubitLoadedState).copyWith(
          searchQuery: query,
        ),
      );
    }
  }

  @override
  Future<void> kickOff() async {
    emit(
      JournalListCubitLoadingState(
        searchQuery: currentQuery,
      ),
    );

    try {
      final resp = await loadData();

      emit(
        JournalListCubitLoadedState(
          data: resp.results,
          page: resp.page,
          paginatedDate: resp.paginatedDate,
          totalPages: resp.totalPages,
          totalResults: resp.totalResults,
          searchQuery: currentQuery,
          isLoadingMoreData: false,
        ),
      );
    } on AppException catch (ex, stackTrace) {
      gotError(ex, stackTrace);
      emit(
        JournalListCubitErrorState(
          error: ex,
          searchQuery: currentQuery,
        ),
      );
    } catch (ex, stackTrace) {
      gotError(ex, stackTrace);
      emit(
        JournalListCubitErrorState(
          error: DefaultAppException(),
          searchQuery: currentQuery,
        ),
      );
    }
  }

  Future<void> loadMore() async {
    final newPage = currentPage + 1;
    final paginatedState = state as JournalListCubitLoadedState;

    if (paginatedState.isLoadingMoreData) return;

    emit(
      paginatedState.copyWith(
        isLoadingMoreData: true,
      ),
    );

    try {
      final resp = await journalRepository.getItems(
        page: newPage,
      );
      final oldData = paginatedState.data ?? [];
      emit(
        paginatedState.copyWith(
          page: newPage,
          totalPages: resp.totalPages,
          totalResults: resp.totalResults,
          paginatedDate: resp.paginatedDate,
          data: [...oldData, ...resp.results],
          searchQuery: currentQuery,
          isLoadingMoreData: false,
        ),
      );
    } catch (ex) {
      emit(
        paginatedState.copyWith(
          error: ex,
          searchQuery: currentQuery,
          isLoadingMoreData: false,
        ),
      );
    }
  }

  @override
  Future<BasePaginatedResponse<Journal>> loadData() {
    return journalRepository.getItems(
      page: currentPage,
    );
  }
}
