import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../vm/_/action/focus_node.dart';
import '../config/params.dart';

NewViewAfterFirstLayout(BuildContext context, NewParams params, String? tag) {
  Timer(Duration(milliseconds: 500), () {
    FocusNodeAction(tag: tag);
  });
}
