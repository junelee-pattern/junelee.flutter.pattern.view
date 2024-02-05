import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../page/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewMarkdownPolicyParams params,
    {String? tag}) async {
  NewMarkdownPolicyVMUtil.registeredVM(params, tag: tag);
  NewMarkdownPolicyVM viewModel = NewMarkdownPolicyVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
