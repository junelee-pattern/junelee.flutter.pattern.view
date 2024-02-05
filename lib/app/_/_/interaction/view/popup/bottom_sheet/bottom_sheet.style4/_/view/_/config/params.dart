import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

class NewParams {
  void Function(BuildContext) onTap = (context) async {};
  late BuildContext context;

  NewParams({required this.onTap});
}
