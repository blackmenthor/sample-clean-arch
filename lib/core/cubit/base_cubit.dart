import 'package:bloc/bloc.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

abstract class BaseCubit<T> extends Cubit<BaseCubitState> {
  BaseCubit({
      BaseCubitState? initial,
  }) : super(initial ?? BaseCubitIdleState());

  void gotError(dynamic error, StackTrace stackTrace) {
    logger.e(error: error, stackTrace: stackTrace);
  }
}
