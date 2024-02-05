import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemColumnButton3VMUtil {
  //vm 등록
  static registeredVM(NewItemColumnButton3Params params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemColumnButton3UtilVM>(tag: tag)) {
      var _ = Get.put(NewItemColumnButton3UtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemColumnButton3VM>(tag: tag)) {
      var _ = Get.put(
          NewItemColumnButton3VM(
              Get.find<NewItemColumnButton3UtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemColumnButton3VM vm({String? tag}) {
    return Get.find<NewItemColumnButton3VM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemColumnButton3UtilVM>(tag: tag, force: true);
    Get.delete<NewItemColumnButton3VM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemColumnButton3UtilVM extends GetxController {
  NewItemColumnButton3UtilVM({this.tag});

  notify() {
    NewItemColumnButton3VM vm = NewItemColumnButton3VMUtil.vm(tag: tag);
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
