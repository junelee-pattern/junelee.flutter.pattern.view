import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

FocusNodeAction({String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);
  viewModel.myFocusNode.requestFocus();
}
