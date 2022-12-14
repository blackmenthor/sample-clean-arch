import 'package:flutter_clean_arch/core/cubit/base_cubit.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';

abstract class BaseLoadableCubit<T> extends BaseCubit<T> {
  BaseLoadableCubit() : super() {
    kickOff();
  }

  Future<void> kickOff() async {
    emit(BaseCubitLoadingState());
    try {
      final resp = await loadData();
      emit(
        BaseCubitLoadedState(data: resp),
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

  Future<T> loadData();
}
