import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

class NewAllowItemParams {
  int id = 0;
  String label = '';
  VoidCallback onTap = () {};
  VoidCallback detailPageOnTap = () {};
  late BuildContext context;

  NewAllowItemParams({
    required this.id,
    required this.label,
    required this.onTap,
    required this.detailPageOnTap,
  });
}
