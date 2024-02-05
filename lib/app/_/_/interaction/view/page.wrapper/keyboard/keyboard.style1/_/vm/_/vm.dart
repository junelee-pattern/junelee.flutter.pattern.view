import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import 'util.dart';

class NewVM extends GetxController {
  /// write your variables here.
  final TextEditingController textEditingController = TextEditingController();

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
