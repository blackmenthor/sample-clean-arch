import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_clean_arch/domain/auth/models/user.dart';
import 'package:flutter_clean_arch/domain/auth/repository/auth_api_repository.dart';

class AuthRepository {
  final cacheSource = locator.get<PrefsService>();
  final remoteSource = AuthAPIRepository();

  bool get hasToken => token != null;

  String? get token => cacheSource.getToken();
  String? get refreshToken => cacheSource.getRefreshToken();
  String? get username => cacheSource.getUsername();
  String? get firstName => cacheSource.getFirstName();

  Future<void> logout() async {
    await cacheSource.logout();
    return;
  }

  Future<User> login({
    required String username,
    required String password,
  }) async {
    return remoteSource.login(
        username: username,
        password: password,
    );
  }

  Future<void> refresh() async {
    return remoteSource.refreshToken(
      refreshToken: refreshToken ?? '',
    );
  }

  Future<User> register({
    required String username,
    required String firstName,
    required String password,
  }) {
    return remoteSource.register(
        username: username,
        firstName: firstName,
        password: password,
    );
  }
}
