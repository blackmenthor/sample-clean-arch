import 'package:flutter_clean_arch/core/cubit/base_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';
import 'package:flutter_clean_arch/domain/auth/pages/register/cubit/register_state.dart';
import 'package:flutter_clean_arch/domain/auth/repository/auth_repository.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(initial: IdleRegisterState());

  final authRepository = locator.get<AuthRepository>();

  RegisterState get currentState => state as RegisterState;

  void setObscure({required bool obscure}) {
    emit(
      currentState.copyWith(
        obscurePassword: obscure,
      ),
    );
  }

  void setUsername({required String username}) {
    emit(
      currentState.copyWith(
        username: username,
      ),
    );
  }

  void setFirstname({required String firstname}) {
    emit(
      currentState.copyWith(
        firstname: firstname,
      ),
    );
  }

  void setPassword({required String password}) {
    emit(
      currentState.copyWith(
        password: password,
      ),
    );
  }

  void register() async {
    emit(
      currentState.forLoading(),
    );

    try {
      await authRepository.register(
          username: currentState.username!,
          firstName: currentState.firstname!,
          password: currentState.password!,
      );

      emit(
        currentState.forRegistered(),
      );
    } catch (ex, trace) {
      var exception = ex;
      if (exception is! AppException) {
        exception = DefaultAppException();
      }
      logger.e(error: ex, stackTrace: trace);
      emit(
        currentState.forError(error: exception)
      );
      emit(
        currentState.forIdle(),
      );
    }
  }

}