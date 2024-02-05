import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

clickButtonUserAction(
    BuildContext context, Future<void> Function(BuildContext) onPressed) async {
  await onPressed(context);

  Navigator.of(context).pop();
}
