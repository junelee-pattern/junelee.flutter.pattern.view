import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../widget/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewItemRowButton3Params params,
    {String? tag}) async {
  NewItemRowButton3VMUtil.registeredVM(params, tag: tag);
  NewItemRowButton3VM viewModel = NewItemRowButton3VMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
