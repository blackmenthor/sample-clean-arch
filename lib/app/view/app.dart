import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/app/cubit/state.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/router/router.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';
import 'package:flutter_clean_arch/ui/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  AppTheme get theme => AppTheme();
  final appCubit = locator.get<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appCubit,
      child: BlocBuilder<AppCubit, AppState>(
        bloc: appCubit,
        builder: (ctx, state) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: MaterialApp.router(
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme,
              themeMode: state.themeMode,
              localizationsDelegates: const [
                CleanLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: CleanLocalizations.supportedLocales,
              routerConfig: appRouter,
            ),
          );
        },
      ),
    );
  }
}
