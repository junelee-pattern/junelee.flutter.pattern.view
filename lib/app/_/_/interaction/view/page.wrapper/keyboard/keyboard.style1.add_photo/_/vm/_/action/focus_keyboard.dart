import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

focusKeyboardAction({String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  viewModel.focusNode.requestFocus();

  viewModel.util.notify();
}
