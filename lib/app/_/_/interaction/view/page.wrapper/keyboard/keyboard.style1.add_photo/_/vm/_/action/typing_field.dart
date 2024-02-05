import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';
import 'change_send_button_color.dart';

TypingTextFieldAction(String value, {String? tag}) {
  // NewVM viewModel = NewVMUtil.vm(tag: tag);
  // log(value);

  if (value.isNotEmpty) {
    changeSendButtonColorAction(true, tag: tag);
  } else {
    changeSendButtonColorAction(false, tag: tag);
  }

  // viewModel.util.notify();
}
