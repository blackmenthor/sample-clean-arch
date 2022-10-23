import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/app/cubit/app_cubit.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/kickoff/cubit/kickoff_page_cubit.dart';
import 'package:flutter_clean_arch/ui/components/base_loadable_scaffold.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';

class KickOffPage extends StatelessWidget {
  const KickOffPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KickOffPageCubit(),
      child: BaseLoadableScaffold<bool, KickOffPageCubit>(
        onRetry: (ctx) => ctx.read<KickOffPageCubit>().kickOff(),
        customLoadingWidget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 32,
              ),
              Text(
                context.l10n.initializingApp,
                style: context.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
        listener: (state) {
          if (state is BaseCubitLoadedState) {
            context.read<AppCubit>().kickedOff();
            if (state.data) {
              context.replace('/journal');
            } else {
              context.replace('/login');
            }
          }
        },
        builder: (ctx, value) {
          // will be called once App is loaded
          return const SizedBox();
        },
      ),
    );
  }
}
