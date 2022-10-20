import 'package:flutter/material.dart';

class AutoKeepAliveWidget extends StatefulWidget {
  const AutoKeepAliveWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AutoKeepAliveWidget> createState() => _AutoKeepAliveWidgetState();
}

class _AutoKeepAliveWidgetState extends State<AutoKeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
