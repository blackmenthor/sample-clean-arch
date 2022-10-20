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

class JournalListPage extends StatelessWidget {
  const JournalListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalListCubit(),
      child: BaseLoadableScaffold<BasePaginatedResponse<Journal>, JournalListCubit>(
        title: 'Journal List Page',
        appbarActions: [
          // TODO:
          // IconButton(
          //     onPressed: () async {
          //       // TODO: to add journal page
          //     },
          //     icon: const Icon(
          //       Icons.add,
          //       size: 18.0,
          //     ),
          // ),
          // IconButton(
          //     onPressed: () {
          //       // TODO: to logout dialog
          //     },
          //     icon: const Icon(
          //       Icons.logout,
          //       size: 18.0,
          //     ),
          // ),
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
