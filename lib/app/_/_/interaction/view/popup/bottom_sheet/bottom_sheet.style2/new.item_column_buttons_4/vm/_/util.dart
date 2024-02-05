import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../widget/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewItemColumnButton4VMUtil {
  //vm 등록
  static registeredVM(NewItemColumnButton4Params params,
      {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewItemColumnButton4UtilVM>(tag: tag)) {
      var _ = Get.put(NewItemColumnButton4UtilVM(tag: tag),
          permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewItemColumnButton4VM>(tag: tag)) {
      var _ = Get.put(
          NewItemColumnButton4VM(
              Get.find<NewItemColumnButton4UtilVM>(tag: tag)),
          permanent: permanent ?? true,
          tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewItemColumnButton4VM vm({String? tag}) {
    return Get.find<NewItemColumnButton4VM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewItemColumnButton4UtilVM>(tag: tag, force: true);
    Get.delete<NewItemColumnButton4VM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewItemColumnButton4UtilVM extends GetxController {
  NewItemColumnButton4UtilVM({this.tag});

  notify() {
    NewItemColumnButton4VM vm = NewItemColumnButton4VMUtil.vm(tag: tag);
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
