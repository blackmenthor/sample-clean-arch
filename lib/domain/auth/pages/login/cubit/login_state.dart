import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';

class LoginState extends BaseCubitState {
  LoginState({
      this.username,
      this.password,
      this.obscurePassword = true,
  });

  final String? username;
  final String? password;
  final bool obscurePassword;

  LoginState copyWith({
    String? username,
    String? password,
    bool? obscurePassword,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  bool get canSubmit => (username?.isNotEmpty ?? false)
    && (password?.isNotEmpty ?? false);

  IdleLoginState forIdle() {
    return IdleLoginState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
    );
  }

  ErrorLoginState forError({
    dynamic error,
  }) {
    return ErrorLoginState(
        obscurePassword: obscurePassword,
        password: password,
        username: username,
        error: error,
    );
  }

  LoadingLoginState forLoading() {
    return LoadingLoginState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
    );
  }

  LoggedInLoginState forLoggedIn() {
    return LoggedInLoginState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
    );
  }

}

class IdleLoginState extends LoginState {
  IdleLoginState({
      String? username,
      String? password,
      bool obscurePassword = true,
  }) : super(username: username, password: password, obscurePassword: obscurePassword,);

}

class ErrorLoginState extends LoginState {
  ErrorLoginState({
    String? username,
    String? password,
    bool obscurePassword = true,
    required this.error,
  }) : super(username: username, password: password, obscurePassword: obscurePassword);

  final AppException error;

}

class LoadingLoginState extends LoginState {
  LoadingLoginState({
    String? username,
    String? password,
    bool obscurePassword = true,
  }) : super(username: username, password: password, obscurePassword: obscurePassword);

}

class LoggedInLoginState extends LoginState {
  LoggedInLoginState({
    String? username,
    String? password,
    bool obscurePassword = true,
  }) : super(username: username, password: password, obscurePassword: obscurePassword);

}


