import 'package:flutter_clean_arch/core/cubit/states.dart';

extension BaseCubitStateExt on BaseCubitState {
  bool get isLoading => this is BaseCubitLoadingState;
  bool get hasError => this is BaseCubitErrorState;
}
