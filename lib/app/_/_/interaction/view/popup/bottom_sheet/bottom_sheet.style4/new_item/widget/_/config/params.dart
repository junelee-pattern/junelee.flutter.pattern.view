import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

class NewItemParams {
  IconData icon = Icons.add;
  String permissionTitle = 'Permission Title';
  String permissionDescription = 'Permission Description';
  late BuildContext context;

  NewItemParams({
    required this.icon,
    required this.permissionTitle,
    required this.permissionDescription,
  });
}
