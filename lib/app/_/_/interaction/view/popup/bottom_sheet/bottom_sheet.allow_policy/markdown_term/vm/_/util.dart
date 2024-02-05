import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../page/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewMarkdownTermVMUtil {
  //vm 등록
  static registeredVM(NewMarkdownTermParams params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewMarkdownTermUtilVM>(tag: tag)) {
      var _ = Get.put(NewMarkdownTermUtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewMarkdownTermVM>(tag: tag)) {
      var _ = Get.put(
          NewMarkdownTermVM(Get.find<NewMarkdownTermUtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewMarkdownTermVM vm({String? tag}) {
    return Get.find<NewMarkdownTermVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewMarkdownTermUtilVM>(tag: tag, force: true);
    Get.delete<NewMarkdownTermVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewMarkdownTermUtilVM extends GetxController {
  NewMarkdownTermUtilVM({this.tag});

  notify() {
    NewMarkdownTermVM vm = NewMarkdownTermVMUtil.vm(tag: tag);
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
