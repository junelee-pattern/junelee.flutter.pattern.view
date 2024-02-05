import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../view/_/config/params.dart';
import '../util.dart';
import '../vm.dart';

Future<void> readyVMAction(BuildContext context, NewParams params,
    {String? tag}) async {
  NewVMUtil.registeredVM(params, tag: tag);
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  // get information here that you need to get

  viewModel.util.notify();
}
