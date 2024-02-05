import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemVMUtil {
  //vm 등록
  static registeredVM(NewItemParams params, {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemUtilVM>(tag: tag)) {
      var _ = Get.put(NewItemUtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemVM>(tag: tag)) {
      var _ = Get.put(NewItemVM(Get.find<NewItemUtilVM>(tag: tag)),
          permanent: permanent ?? true, tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemVM vm({String? tag}) {
    return Get.find<NewItemVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemUtilVM>(tag: tag, force: true);
    Get.delete<NewItemVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemUtilVM extends GetxController {
  NewItemUtilVM({this.tag});

  notify() {
    NewItemVM vm = NewItemVMUtil.vm(tag: tag);
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
