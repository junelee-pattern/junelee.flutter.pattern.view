import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';

class NewItemParams {
  IconData icon = Icons.menu;
  String buttonText = '메뉴';
  Future<void> Function(BuildContext) onPressed = (context) async {};
  late BuildContext context;

  NewItemParams({
    required this.icon,
    required this.buttonText,
    required this.onPressed,
  });
}
