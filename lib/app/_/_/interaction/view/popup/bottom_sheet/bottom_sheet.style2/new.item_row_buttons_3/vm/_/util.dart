import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemRowButton3VMUtil {
  //vm 등록
  static registeredVM(NewItemRowButton3Params params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemRowButton3UtilVM>(tag: tag)) {
      var _ = Get.put(NewItemRowButton3UtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemRowButton3VM>(tag: tag)) {
      var _ = Get.put(
          NewItemRowButton3VM(Get.find<NewItemRowButton3UtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemRowButton3VM vm({String? tag}) {
    return Get.find<NewItemRowButton3VM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemRowButton3UtilVM>(tag: tag, force: true);
    Get.delete<NewItemRowButton3VM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemRowButton3UtilVM extends GetxController {
  NewItemRowButton3UtilVM({this.tag});

  notify() {
    NewItemRowButton3VM vm = NewItemRowButton3VMUtil.vm(tag: tag);
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
