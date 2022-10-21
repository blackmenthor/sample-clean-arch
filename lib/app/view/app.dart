import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/app/cubit/state.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/core/router/router.dart';
import 'package:flutter_clean_arch/l10n/l10n.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';
import 'package:flutter_clean_arch/ui/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  AppTheme get theme => AppTheme();
  final appCubit = locator.get<AppCubit>();

  Widget btn(BuildContext ctx) {
    return Positioned(
      left: 16.0,
      bottom: 48.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(96),
        child: IntrinsicWidth(
          child: MaterialButton(
            onPressed: () => ctx.read<AppCubit>().toggleTheme(),
            color: ctx.colors.primary,
            child: Icon(
              ctx.isDark
                  ? Icons.star
                  : Icons.sunny,
              color: ctx.colors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

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
              builder: (ctx, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    child ?? Container(),
                    btn(ctx),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
