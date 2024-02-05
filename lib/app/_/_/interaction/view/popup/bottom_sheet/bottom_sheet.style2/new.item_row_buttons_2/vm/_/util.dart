import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemRowButton2VMUtil {
  //vm 등록
  static registeredVM(NewItemRowButton2Params params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemRowButton2UtilVM>(tag: tag)) {
      var _ = Get.put(NewItemRowButton2UtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemRowButton2VM>(tag: tag)) {
      var _ = Get.put(
          NewItemRowButton2VM(Get.find<NewItemRowButton2UtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemRowButton2VM vm({String? tag}) {
    return Get.find<NewItemRowButton2VM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemRowButton2UtilVM>(tag: tag, force: true);
    Get.delete<NewItemRowButton2VM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemRowButton2UtilVM extends GetxController {
  NewItemRowButton2UtilVM({this.tag});

  notify() {
    NewItemRowButton2VM vm = NewItemRowButton2VMUtil.vm(tag: tag);
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
