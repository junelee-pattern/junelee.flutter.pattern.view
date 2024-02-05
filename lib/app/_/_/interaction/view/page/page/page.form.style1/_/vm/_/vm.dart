import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import 'util.dart';

class NewVM extends GetxController {
  /// write your variables here.
  TextEditingController textEditController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool inputButtonEnabled = false;
  final formKey = GlobalKey<FormState>();

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
