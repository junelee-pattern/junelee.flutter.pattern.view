import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../page/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(
    BuildContext context, NewMarkdownTempleteParams params,
    {String? tag}) async {
  NewMarkdownTempleteVMUtil.registeredVM(params, tag: tag);
  NewMarkdownTempleteVM viewModel = NewMarkdownTempleteVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
