import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemColumnButton2VMUtil {
  //vm 등록
  static registeredVM(NewItemColumnButton2Params params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemColumnButton2UtilVM>(tag: tag)) {
      var _ = Get.put(NewItemColumnButton2UtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemColumnButton2VM>(tag: tag)) {
      var _ = Get.put(
          NewItemColumnButton2VM(
              Get.find<NewItemColumnButton2UtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemColumnButton2VM vm({String? tag}) {
    return Get.find<NewItemColumnButton2VM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemColumnButton2UtilVM>(tag: tag, force: true);
    Get.delete<NewItemColumnButton2VM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemColumnButton2UtilVM extends GetxController {
  NewItemColumnButton2UtilVM({this.tag});

  notify() {
    NewItemColumnButton2VM vm = NewItemColumnButton2VMUtil.vm(tag: tag);
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
