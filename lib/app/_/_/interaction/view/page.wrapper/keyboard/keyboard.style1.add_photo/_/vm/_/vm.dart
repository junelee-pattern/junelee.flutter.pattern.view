import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import 'util.dart';

class NewVM extends GetxController {
  /// write your variables here.
  final TextEditingController textEditingController = TextEditingController();
  bool enableSendButton = false;
  List<String> photos = [];
  FocusNode focusNode = FocusNode();

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
