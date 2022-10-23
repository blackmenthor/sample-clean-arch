import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/auth/api/user_api.dart';
import 'package:flutter_clean_arch/domain/auth/models/user.dart';

class AuthAPIRepository {
  final authApi = locator.get<AuthApi>();

  Future<User> login({
    required String username,
    required String password,
  }) {
    return authApi.login(
      username: username,
      password: password,
    );
  }

  Future<void> refreshToken({
    required String refreshToken,
  }) {
    return authApi.refreshToken(
      refreshToken: refreshToken,
    );
  }

  Future<User> register({
    required String username,
    required String firstName,
    required String password,
  }) {
    return authApi.register(
        username: username,
        firstName: firstName,
        password: password,
    );
  }

}
