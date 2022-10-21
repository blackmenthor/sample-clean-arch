import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/extensions/context_extensions.dart';

Future<bool> showPromptDialog({
  required BuildContext context,
  required String title,
  String? message,
}) async {
  final resp = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium,
                ),
                if (message != null) ...[
                  const SizedBox(height: 8,),
                  Text(
                    message,
                  ),
                ],
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: MaterialButton(
                          color: context.colors.error,
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            context.l10n.no,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Center(
                        child: MaterialButton(
                          color: context.colors.primary,
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(
                            context.l10n.yes,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
  );
  return resp ?? false;
}