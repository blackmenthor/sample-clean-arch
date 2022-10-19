import 'package:flutter/material.dart';

void showLoadingDialog({
  required BuildContext context,
}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text(
              'Loading, please wait...',
            ),
          ],
        );
      },
  );
}