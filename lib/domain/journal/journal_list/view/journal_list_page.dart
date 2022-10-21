import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/api/models/base_paginated_response.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/components/journal_item_widget.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/cubit/journal_list_cubit.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/cubit/journal_list_cubit_state.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/ui/components/base_loadable_scaffold.dart';
import 'package:flutter_clean_arch/ui/components/base_search_text_field.dart';
import 'package:flutter_clean_arch/ui/components/default_shimmer.dart';
import 'package:flutter_clean_arch/ui/components/infinity_list_view.dart';
import 'package:flutter_clean_arch/ui/dialogs/loading_dialog.dart';
import 'package:flutter_clean_arch/ui/dialogs/prompt_dialog.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';

class JournalListPage extends StatelessWidget {
  JournalListPage({
    Key? key,
  }) : super(key: key);

  final cubit = JournalListCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: BaseLoadableScaffold<BasePaginatedResponse<Journal>, JournalListCubit>(
        title: 'Journal List Page',
        appbarActions: [
          IconButton(
              onPressed: () async {
                final resp = await showPromptDialog(
                    context: context,
                    title: context.l10n.logoutPrompt,
                );
                if (resp) {
                  showLoadingDialog(context: context);
                  await cubit.logout();
                  context.replace('/login');
                }
              },
              icon: const Icon(
                Icons.logout,
                size: 18.0,
              ),
          ),
        ],
        customLoadingWidget: const DefaultAppShimmer(),
        onRetry: (ctx) => ctx.read<JournalListCubit>().kickOff(),
        stateBuilder: (ctx, state) {
          final paginatedState = state as JournalListCubitLoadedState?;

          return Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: BaseSearchTextField(
                  hint: 'Search for journals...',
                  onChanged: (query) =>
                      ctx.read<JournalListCubit>().searchItem(query: query),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: InfinityListView<Journal>(
                  items: paginatedState!.filteredData ?? [],
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  hasMore: paginatedState.hasMore,
                  onLoadMore: () {
                    ctx.read<JournalListCubit>().loadMore();
                  },
                  itemBuilder: (ctx, Journal journal, idx) {
                    return JournalItemWidget(
                      index: idx,
                      journal: journal,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
