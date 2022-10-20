import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/core/api/api.dart';
import 'package:flutter_clean_arch/core/hive/hive_service.dart';
import 'package:flutter_clean_arch/core/models/credentials.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';
import 'package:flutter_clean_arch/domain/auth/api/user_api.dart';
import 'package:flutter_clean_arch/domain/auth/repository/auth_repository.dart';
import 'package:flutter_clean_arch/domain/journal/repository/journal_repository.dart';
import 'package:flutter_clean_arch/utils/constants.dart';
import 'package:flutter_clean_arch/utils/logger/logger.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class DependencyInjection {

  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator
      ..registerSingleton<AppLogger>(AppLogger())
      ..registerSingleton<Connectivity>(Connectivity())
      ..registerSingleton<Credentials>(credentials[env]!)
      ..registerSingleton<Prefs>(Prefs())
      ..registerLazySingleton(() {
        final baseEndpoint = credentials[env]!.baseEndpoint;
        final dioOptions = BaseOptions(
          baseUrl: baseEndpoint,
          receiveTimeout: Constants.apiCallEndpoint.inMilliseconds,
          sendTimeout: Constants.apiCallEndpoint.inMilliseconds,
        );
        return Dio(dioOptions);
      })
      ..registerSingleton<AuthApi>(AuthApi(
        baseEndpoint: locator.get<Credentials>().baseEndpoint,
      ))
      ..registerLazySingleton<Api>(() {
        final credentials = locator.get<Credentials>();
        return Api.create(
          credentials: credentials,
        );
      })
      ..registerSingleton<HiveService>(HiveService())
      ..registerSingleton<AppCubit>(AppCubit())
      ..registerSingleton<JournalRepository>(JournalRepository())
      ..registerSingleton<AuthRepository>(AuthRepository());
  }

}
