import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

checkEnableConfirmButtonAction(String value, {String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  if (value.length > 5) {
    viewModel.inputButtonEnabled = true;
  } else {
    viewModel.inputButtonEnabled = false;
  }

  viewModel.util.notify();
}
