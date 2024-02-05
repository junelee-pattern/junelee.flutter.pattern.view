import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../page/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewMarkdownTermParams params,
    {String? tag}) async {
  NewMarkdownTermVMUtil.registeredVM(params, tag: tag);
  NewMarkdownTermVM viewModel = NewMarkdownTermVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
