import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';

Future<void> showLoadingDialog({
  required BuildContext context,
}) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return const LoadingDialog();
      },
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16,),
            Text(
              context.l10n.pleaseWait,
            )
          ],
        ),
      ),
    );
  }
}
