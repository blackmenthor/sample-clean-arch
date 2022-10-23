import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/cubit/base_loadable_cubit.dart';
import 'package:flutter_clean_arch/core/cubit/states.dart';
import 'package:flutter_clean_arch/core/extensions/base_bloc_state_extension.dart';
import 'package:flutter_clean_arch/ui/components/base_scaffold.dart';
import 'package:flutter_clean_arch/ui/components/button.dart';

const kAppBarBottomHeight = 54.0;

class BaseLoadableScaffold<T, R extends BaseLoadableCubit<T>>
    extends StatelessWidget {
  const BaseLoadableScaffold({
    Key? key,
    this.builder,
    this.stateBuilder,
    this.title,
    this.appBarBottom,
    this.appBarBottomHeight = kAppBarBottomHeight,
    this.listener,
    this.floatingActionButton,
    this.customLoadingWidget,
    this.onRetry,
    this.appbarActions,
  }) : super(key: key);

  final Widget Function(BuildContext, T?)? builder;
  final Widget Function(BuildContext, BaseCubitState?)? stateBuilder;
  final String? title;
  final Widget Function(BuildContext)? appBarBottom;
  final double appBarBottomHeight;
  final void Function(BaseCubitState)? listener;
  final Widget? floatingActionButton;
  final Widget? customLoadingWidget;
  final void Function(BuildContext)? onRetry;
  final List<Widget>? appbarActions;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: title,
      appbarActions: appbarActions,
      floatingActionButton: floatingActionButton,
      appBarBottom: appBarBottom == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(appBarBottomHeight),
              child: appBarBottom!(context),
            ),
      builder: (ctx) => BlocConsumer<R, BaseCubitState>(
        listener: (ctx, BaseCubitState state) {
          if (listener != null) {
            listener!(state);
          }
        },
        builder: (ctx, BaseCubitState state) {
          if (state.isLoading) {
            return customLoadingWidget ??
                const Center(
                  child: CircularProgressIndicator(),
                );
          }

          if (state.hasError) {
            state = state as BaseCubitErrorState;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.error.userFriendlyMessage,
                      textAlign: TextAlign.center,
                    ),
                    if (onRetry != null) ...[
                      const SizedBox(
                        height: 16,
                      ),
                      AppButton(
                        text: 'Retry',
                        onTap: () => onRetry!(context),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }

          if (stateBuilder != null) {
            return stateBuilder!(context, state);
          }

          final data = (state as BaseCubitLoadedState<T>).data;
          return builder!(context, data);
        },
      ),
    );
  }
}
