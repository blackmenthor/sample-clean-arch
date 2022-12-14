import 'package:flutter/material.dart';

typedef Builder = Widget Function(BuildContext);

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    required this.builder,
    this.title,
    this.appBarBottom,
    this.floatingActionButton,
    this.appbarActions,
  }) : super(key: key);

  final String? title;
  final PreferredSizeWidget? appBarBottom;
  final Builder builder;
  final Widget? floatingActionButton;
  final List<Widget>? appbarActions;

  bool get withAppbar => title != null || appBarBottom != null;

  PreferredSizeWidget? _buildAppbar(BuildContext context) {
    if (!withAppbar) return null;
    return AppBar(
      title: title != null
          ? Text(
              title!,
            )
          : null,
      bottom: appBarBottom != null ? appBarBottom! : null,
      actions: appbarActions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: builder(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: floatingActionButton,
    );
  }
}
