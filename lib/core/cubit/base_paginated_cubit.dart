import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/core/api/models/response_object.dart';
import 'package:flutter_clean_arch/core/cubit/base_loadable_cubit.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

abstract class BasePaginatedCubit<T extends ResponseObject>
    extends BaseLoadableCubit<BasePaginatedResponse<T>> {
  BasePaginatedCubit() : super() {
    kickOff();
  }

  bool get hasMore {
    if (state is! BasePaginatedCubitLoadedState) return false;
    final paginatedState = state as BasePaginatedCubitLoadedState;
    return paginatedState.hasMore;
  }

  int get currentPage {
    if (state is! BasePaginatedCubitLoadedState) return 1;
    final paginatedState = state as BasePaginatedCubitLoadedState;
    return paginatedState.page;
  }

  @override
  void gotError(dynamic error, StackTrace stackTrace) {
    logger.e(error: error, stackTrace: stackTrace);
  }

  @override
  Future<BasePaginatedResponse<T>> loadData();

  @override
  Future<void> kickOff() async {
    emit(BaseCubitLoadingState());
    try {
      final resp = await loadData();
      emit(
        BasePaginatedCubitLoadedState<T>(
          data: resp.results,
          page: resp.page,
          paginatedDate: resp.paginatedDate,
          totalPages: resp.totalPages,
          totalResults: resp.totalResults,
        ),
      );
    } on AppException catch (ex, stackTrace) {
      gotError(ex, stackTrace);
      emit(BaseCubitErrorState(error: ex));
    } catch (ex, stackTrace) {
      gotError(ex, stackTrace);
      emit(
        BaseCubitErrorState(
          error: DefaultAppException(),
        ),
      );
    }
  }
}
