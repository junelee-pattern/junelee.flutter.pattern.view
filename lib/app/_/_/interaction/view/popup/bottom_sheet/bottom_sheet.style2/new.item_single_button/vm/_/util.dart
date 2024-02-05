import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemSingleButtonVMUtil {
  //vm 등록
  static registeredVM(NewItemSingleButtonParams params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemSingleButtonUtilVM>(tag: tag)) {
      var _ = Get.put(NewItemSingleButtonUtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemSingleButtonVM>(tag: tag)) {
      var _ = Get.put(
          NewItemSingleButtonVM(Get.find<NewItemSingleButtonUtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemSingleButtonVM vm({String? tag}) {
    return Get.find<NewItemSingleButtonVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemSingleButtonUtilVM>(tag: tag, force: true);
    Get.delete<NewItemSingleButtonVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemSingleButtonUtilVM extends GetxController {
  NewItemSingleButtonUtilVM({this.tag});

  notify() {
    NewItemSingleButtonVM vm = NewItemSingleButtonVMUtil.vm(tag: tag);
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
