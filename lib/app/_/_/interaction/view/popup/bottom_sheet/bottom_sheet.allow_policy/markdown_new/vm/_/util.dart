import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../page/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewMarkdownTempleteVMUtil {
  //vm 등록
  static registeredVM(NewMarkdownTempleteParams params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewMarkdownTempleteUtilVM>(tag: tag)) {
      var _ = Get.put(NewMarkdownTempleteUtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewMarkdownTempleteVM>(tag: tag)) {
      var _ = Get.put(
          NewMarkdownTempleteVM(Get.find<NewMarkdownTempleteUtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewMarkdownTempleteVM vm({String? tag}) {
    return Get.find<NewMarkdownTempleteVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewMarkdownTempleteUtilVM>(tag: tag, force: true);
    Get.delete<NewMarkdownTempleteVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewMarkdownTempleteUtilVM extends GetxController {
  NewMarkdownTempleteUtilVM({this.tag});

  notify() {
    NewMarkdownTempleteVM vm = NewMarkdownTempleteVMUtil.vm(tag: tag);
    int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;

    if (_lastUpdateTime + 200 < currentTimeMillis) {
      vm.update();
      _lastUpdateTime = currentTimeMillis;
    } else {
      Timer(const Duration(milliseconds: 200), () {
        int currentTimeMillis = DateTime.now().millisecondsSinceEpoch;
        if (_lastUpdateTime + 150 < currentTimeMillis) {
          vm.update();
          _lastUpdateTime = currentTimeMillis;
        }
      });
    }
  }

  final String? tag;
  int _lastUpdateTime = 0;
}
