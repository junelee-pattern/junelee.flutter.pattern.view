import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

removePhotoItemAction(int index, {String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  if (index >= 0 && index < viewModel.photos.length) {
    viewModel.photos.removeAt(index);
  }

  viewModel.util.notify();
}
