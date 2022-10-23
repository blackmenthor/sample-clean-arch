import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: context.colors.primary,
      child: Text(
        text,
        style: context.textTheme.button!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
