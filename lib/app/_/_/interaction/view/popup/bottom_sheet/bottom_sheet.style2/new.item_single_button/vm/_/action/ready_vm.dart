import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../widget/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(
    BuildContext context, NewItemSingleButtonParams params,
    {String? tag}) async {
  NewItemSingleButtonVMUtil.registeredVM(params, tag: tag);
  NewItemSingleButtonVM viewModel = NewItemSingleButtonVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
