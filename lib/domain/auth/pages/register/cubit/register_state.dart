import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/exceptions/app_exception.dart';

class RegisterState extends BaseCubitState {
  RegisterState({
    this.username,
    this.firstname,
    this.password,
    this.obscurePassword = true,
  });

  final String? username;
  final String? firstname;
  final String? password;
  final bool obscurePassword;

  RegisterState copyWith({
    String? username,
    String? firstname,
    String? password,
    bool? obscurePassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      firstname: firstname ?? this.firstname,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  bool get canSubmit => (username?.isNotEmpty ?? false)
      && (firstname?.isNotEmpty ?? false)
      && (password?.isNotEmpty ?? false);

  IdleRegisterState forIdle() {
    return IdleRegisterState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
      firstname: firstname,
    );
  }

  ErrorRegisterState forError({
    dynamic error,
  }) {
    return ErrorRegisterState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
      firstname: firstname,
      error: error,
    );
  }

  LoadingRegisterState forLoading() {
    return LoadingRegisterState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
      firstname: firstname,
    );
  }

  RegisteredState forRegistered() {
    return RegisteredState(
      obscurePassword: obscurePassword,
      password: password,
      username: username,
      firstname: firstname,
    );
  }

}

class IdleRegisterState extends RegisterState {
  IdleRegisterState({
    super.username,
    super.firstname,
    super.password,
    super.obscurePassword = true,
  });
}

class ErrorRegisterState extends RegisterState {
  ErrorRegisterState({
    super.username,
    super.firstname,
    super.password,
    super.obscurePassword = true,
    required this.error,
  });

  final AppException error;
}

class LoadingRegisterState extends RegisterState {
  LoadingRegisterState({
    super.username,
    super.firstname,
    super.password,
    super.obscurePassword = true,
  });
}

class RegisteredState extends RegisterState {
  RegisteredState({
    super.username,
    super.firstname,
    String? password,
    bool obscurePassword = true,
  });
}