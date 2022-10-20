import 'package:flutter_clean_arch/core/cubit/base_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/cubit/login_state.dart';
import 'package:flutter_clean_arch/domain/auth/repository/auth_repository.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(initial: IdleLoginState());

  final authRepository = locator.get<AuthRepository>();

  LoginState get currentState => state as LoginState;

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

  void setPassword({required String password}) {
    emit(
      currentState.copyWith(
        password: password,
      ),
    );
  }

  void login() async {
    emit(
      currentState.forLoading(),
    );

    try {
      await authRepository.login(
          username: currentState.username!,
          password: currentState.password!,
      );

      emit(
        currentState.forLoggedIn(),
      );
    } catch (ex, trace) {
      logger.e(error: ex, stackTrace: trace);
      emit(
        currentState.forError(error: ex)
      );
      emit(
        currentState.forIdle(),
      );
    }
  }

}