import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

writeHereNameAction({String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  viewModel.util.notify();
}
