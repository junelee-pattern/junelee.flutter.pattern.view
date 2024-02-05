import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';
import 'typing_field.dart';

enrollTypingListenerAction({String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  viewModel.textEditingController.addListener(() {
    TypingTextFieldAction(viewModel.textEditingController.text, tag: tag);
  });
  // viewModel.util.notify();
}
