import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/domain/journal/models/journal.dart';
import 'package:go_router/go_router.dart';

class JournalItemWidget extends StatelessWidget {
  const JournalItemWidget({
    Key? key,
    required this.journal,
    required this.index,
  }) : super(key: key);

  final Journal journal;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        context.go('/journal/${journal.id}');
      },
      leading: journal.thumbnail == null ? null : ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          journal.thumbnail!,
          height: 96,
          width: 96,
        ),
      ),
      title: Text(
        journal.title,
      ),
      subtitle: Text(
        journal.body ?? '-',
      ),
    );
  }
}
