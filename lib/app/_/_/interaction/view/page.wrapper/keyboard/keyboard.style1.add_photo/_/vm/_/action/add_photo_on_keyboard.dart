import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../util.dart';
import '../vm.dart';

addPhotoOnKeyboardAction(String photoPath, {String? tag}) {
  NewVM viewModel = NewVMUtil.vm(tag: tag);

  viewModel.photos.add(photoPath);

  viewModel.util.notify();
}
