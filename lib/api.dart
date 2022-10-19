import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/constants.dart';
import 'package:flutter_clean_arch/models.dart';
import 'package:flutter_clean_arch/shared_prefs.dart';


final api = Api();

class Api {

  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
    ),
  );

  Future<String> getToken() async {
    return prefs.getToken()!;
  }

  Future<User> login({
    required String username,
    required String password,
  }) async {
    final url = '${Constants.baseUrl}auth/token/';
    final resp = await dio.post<String>(
        url,
        data: <String, dynamic>{
          'username': username,
          'password': password,
        },
    );
    final json = jsonDecode(resp.data.toString());
    final token = json['token'] as String;
    final refresh = json['refresh'] as String;
    final usernameResp = json['username'] as String;
    final firstName = json['first_name'] as String;

    prefs.setToken(token: token);
    prefs.setRefreshToken(refreshToken: refresh);
    prefs.setUsername(username: usernameResp);
    prefs.setFirstName(firstName: firstName);

    final user = User(
        id: json['id'] as String,
        username: usernameResp,
        firstName: firstName,
        lastName: json['last_name'] as String,
    );
    return user;
  }

  Future<User> register({
    required String username,
    required String firstName,
    required String password,
  }) async {
    final url = '${Constants.baseUrl}auth/users/';
    final resp = await dio.post<String>(
      url,
      data: <String, dynamic>{
        'username': username,
        'first_name': username,
        'password': password,
      },
    );
    final json = jsonDecode(resp.data.toString());
    final token = json['token'] as String;
    final refresh = json['refresh'] as String;
    final usernameResp = json['username'] as String;
    final firstName = json['first_name'] as String;

    prefs.setToken(token: token);
    prefs.setRefreshToken(refreshToken: refresh);
    prefs.setUsername(username: usernameResp);
    prefs.setFirstName(firstName: firstName);

    final user = User(
      id: json['id'] as String,
      username: usernameResp,
      firstName: firstName,
      lastName: json['last_name'] as String,
    );
    return user;
  }

  Future<void> refreshToken({
    required String refreshToken,
  }) async {
    final url = '${Constants.baseUrl}auth/token/refresh/';
    await dio.post<String>(
      url,
      data: <String, dynamic>{
        'refresh': refreshToken,
      },
    );
    return;
  }

  Future<List<Journal>> getJournals() async {
    final url = '${Constants.baseUrl}journal/journal/';
    final token = await getToken();
    final resp = await dio.get<String>(
      url,
      options: Options(
        headers: <String, dynamic>{
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final arr = <Journal>[];
    final json = jsonDecode(resp.data.toString()) as List;
    for (final obj in json) {
      final jsonObj = jsonDecode(obj);
      final journal = Journal(
          id: jsonObj['id'] as String,
          title: jsonObj['title'] as String,
          body: jsonObj['body'] as String,
          thumbnail: jsonObj['thumbnail'] as String,
          deleted: jsonObj['deleted'] as bool,
          isFavorite: jsonObj['is_favorite'] as bool,
          date: jsonObj['date'] as String,
      );
      arr.add(journal);
    }

    return arr;
  }

  Future<Journal> getJournal({
    required String id,
  }) async {
    final url = '${Constants.baseUrl}journal/journal/$id/';
    final token = await getToken();
    final resp = await dio.get<String>(
      url,
      options: Options(
        headers: <String, dynamic>{
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final json = jsonDecode(resp.data.toString());
    final journal = Journal(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      thumbnail: json['thumbnail'] as String,
      deleted: json['deleted'] as bool,
      isFavorite: json['is_favorite'] as bool,
      date: json['date'] as String,
    );

    return journal;
  }

}
