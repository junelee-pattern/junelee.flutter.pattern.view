import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../page/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewMarkdownPolicyVMUtil {
  //vm 등록
  static registeredVM(NewMarkdownPolicyParams params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewMarkdownPolicyUtilVM>(tag: tag)) {
      var _ = Get.put(NewMarkdownPolicyUtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewMarkdownPolicyVM>(tag: tag)) {
      var _ = Get.put(
          NewMarkdownPolicyVM(Get.find<NewMarkdownPolicyUtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewMarkdownPolicyVM vm({String? tag}) {
    return Get.find<NewMarkdownPolicyVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewMarkdownPolicyUtilVM>(tag: tag, force: true);
    Get.delete<NewMarkdownPolicyVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewMarkdownPolicyUtilVM extends GetxController {
  NewMarkdownPolicyUtilVM({this.tag});

  notify() {
    NewMarkdownPolicyVM vm = NewMarkdownPolicyVMUtil.vm(tag: tag);
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
