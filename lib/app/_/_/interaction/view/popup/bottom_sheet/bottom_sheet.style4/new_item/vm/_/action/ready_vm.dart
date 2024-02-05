import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../widget/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewItemParams params,
    {String? tag}) async {
  NewItemVMUtil.registeredVM(params, tag: tag);
  NewItemVM viewModel = NewItemVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
