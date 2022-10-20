import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/components/auto_keep_alive_widget.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';

class InfinityListView<T> extends StatelessWidget {
  const InfinityListView({
    Key? key,
    required this.items,
    required this.hasMore,
    required this.onLoadMore,
    required this.itemBuilder,
    this.autoKeepAlive = false,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final List<T> items;
  final bool hasMore;
  final VoidCallback onLoadMore;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final bool autoKeepAlive;
  final EdgeInsets padding;

  int get itemCount => hasMore ? items.length + 1 : items.length;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          context.l10n.noItemsAvailable,
          style: context.textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      itemCount: itemCount,
      padding: padding,
      itemBuilder: (ctx, idx) {
        if (hasMore && idx == items.length) {
          onLoadMore();
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        final item = items[idx];
        if (autoKeepAlive) {
          return AutoKeepAliveWidget(
            child: itemBuilder(ctx, item, idx),
          );
        }
        return itemBuilder(ctx, item, idx);
      },
    );
  }
}
