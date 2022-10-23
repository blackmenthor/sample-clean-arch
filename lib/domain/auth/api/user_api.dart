import 'package:flutter_clean_arch/core/api/base/base_api.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_clean_arch/domain/auth/models/user.dart';

class AuthApi extends BaseApi<User> {
  AuthApi({
    required String baseEndpoint,
  }) : super(
          baseEndpoint: baseEndpoint,
          serializer: User.serializer,
        );

  final sharedPreferences = prefs;

  Future<User> login({
    required String username,
    required String password,
  }) async {
    final resp = await post(
        path: 'auth/token/',
        body: <String, dynamic>{
          'username': username,
          'password': password,
        },
    );
    sharedPreferences.setToken(token: resp.access!);
    sharedPreferences.setRefreshToken(refreshToken: resp.refresh!);
    sharedPreferences.setUsername(username: resp.username);
    sharedPreferences.setFirstName(firstName: resp.firstName ?? '');

    return resp;
  }

  Future<User> register({
    required String username,
    required String firstName,
    required String password,
  }) async {
    final resp = await post(
      path: 'auth/users/',
      body: <String, dynamic>{
        'username': username,
        'first_name': firstName,
        'last_name': firstName,
        'password': password,
      },
    );
    sharedPreferences.setToken(token: resp.token!);
    sharedPreferences.setRefreshToken(refreshToken: resp.refresh!);
    sharedPreferences.setUsername(username: resp.username);
    sharedPreferences.setFirstName(firstName: resp.firstName ?? '');

    return resp;
  }

  Future<void> refreshToken({
    required String refreshToken,
  }) async {
    await post(
      path: 'auth/token/refresh/',
      body: <String, dynamic>{
        'refresh': refreshToken,
      },
    );
    return;
  }

}
