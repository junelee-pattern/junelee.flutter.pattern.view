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

  String userDialCode = "+1";
  String userCountryCode = "US";
  String internationalPhoneNumber = "";

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
