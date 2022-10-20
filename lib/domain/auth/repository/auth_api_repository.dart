import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/auth/api/user_api.dart';
import 'package:flutter_clean_arch/domain/auth/models/user.dart';

class AuthAPIRepository {
  final api = locator.get<Api>();

  AuthApi get authApi => api.auth;

  Future<User> login({
    required String username,
    required String password,
  }) {
    return authApi.login(
      username: username,
      password: password,
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
