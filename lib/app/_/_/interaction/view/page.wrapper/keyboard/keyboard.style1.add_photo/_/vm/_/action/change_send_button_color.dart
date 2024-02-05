import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

changeSendButtonColorAction(bool enable, {String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);
  viewModel.enableSendButton = enable;

  viewModel.util.notify();
}
