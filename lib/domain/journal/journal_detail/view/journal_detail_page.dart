import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/domain/journal/journal_detail/cubit/journal_detail_cubit.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:flutter_clean_arch/ui/components/base_loadable_scaffold.dart';
import 'package:flutter_clean_arch/ui/components/default_shimmer.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';

class JournalDetailPage extends StatelessWidget {
  const JournalDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalDetailCubit(id: id),
      child: BaseLoadableScaffold<Journal, JournalDetailCubit>(
        title: context.l10n.movieDetail,
        onRetry: (ctx) => ctx.read<JournalDetailCubit>().kickOff(),
        customLoadingWidget: const DefaultAppShimmer(
          withBanner: true,
        ),
        builder: (ctx, journal) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              if (journal?.thumbnail != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    journal!.thumbnail!,
                    width: 348,
                  ),
                ),
              ],
              const SizedBox(height: 16,),
              const Text(
                'Title:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                journal!.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16,),
              const Text(
                'Body:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                journal.body ?? '-',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16,),
              const Text(
                'Date:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                journal.date.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
