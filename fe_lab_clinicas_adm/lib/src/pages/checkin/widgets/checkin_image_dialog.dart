import 'package:fe_lab_clinicas_adm/src/core/env.dart';
import 'package:flutter/material.dart';

class CheckinImageDialog extends AlertDialog {
  CheckinImageDialog(
    BuildContext context, {
    super.key,
    required String pathImage,
  }) : super(
          content: Image.network(
            '${Env.backendBaseUrl}/$pathImage',
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        );
}
