import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/core/cubit/base_loadable_cubit.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/hive/hive_service.dart';
import 'package:flutter_clean_arch/core/shared_prefs/shared_prefs.dart';

class KickOffPageCubit extends BaseLoadableCubit<bool> {
  final appCubit = locator<AppCubit>();
  final hiveService = locator<HiveService>();
  final prefs = locator<Prefs>();

  @override
  Future<bool> loadData() async {
    if (appCubit.state.kickedOff) return Future.value(true);
    // kickOff the app
    // do anything you want to do when the app starts

    // wait for Hive to be initialized
    await hiveService.init();

    // wait for prefs to be initialized
    while (!prefs.initialized) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    appCubit.kickedOff();

    return prefs.isLoggedIn;
  }
}
