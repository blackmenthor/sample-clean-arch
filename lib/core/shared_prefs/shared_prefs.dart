import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefs = locator.get<PrefsService>();

bool isLoggedIn() {
  return prefs.getToken() != null;
}

enum PrefsKeys {
  token,
  refresh,
  username,
  firstName,
}

class PrefsService {

  PrefsService() {
    init();
  }

  SharedPreferences? sharedPreferences;

  bool get initialized => sharedPreferences != null;

  bool get isLoggedIn => getToken() != null;

  Future<void> init() async {
    sharedPreferences = await locator.getAsync<SharedPreferences>();
  }

  String? getToken() {
    return sharedPreferences?.getString(PrefsKeys.token.name);
  }

  Future<bool>? setToken({
    required String token,
  }) {
    return sharedPreferences?.setString(PrefsKeys.token.name, token);
  }

  String? getRefreshToken() {
    return sharedPreferences?.getString(PrefsKeys.refresh.name);
  }

  Future<bool>? setRefreshToken({
    required String refreshToken,
  }) {
    return sharedPreferences?.setString(PrefsKeys.refresh.name, refreshToken);
  }

  String? getUsername() {
    return sharedPreferences?.getString(PrefsKeys.username.name);
  }

  Future<bool>? setUsername({
    required String username,
  }) {
    return sharedPreferences?.setString(PrefsKeys.username.name, username);
  }

  String? getFirstName() {
    return sharedPreferences?.getString(PrefsKeys.firstName.name);
  }

  Future<bool>? setFirstName({
    required String firstName,
  }) {
    return sharedPreferences?.setString(PrefsKeys.firstName.name, firstName);
  }

  Future<bool>? logout() {
    return sharedPreferences?.clear();
  }

}
