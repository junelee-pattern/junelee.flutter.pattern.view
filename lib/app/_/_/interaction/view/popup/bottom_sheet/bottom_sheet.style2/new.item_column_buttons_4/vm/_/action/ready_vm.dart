import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../widget/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(
    BuildContext context, NewItemColumnButton4Params params,
    {String? tag}) async {
  NewItemColumnButton4VMUtil.registeredVM(params, tag: tag);
  NewItemColumnButton4VM viewModel = NewItemColumnButton4VMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
