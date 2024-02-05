import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../page.loading_view_ready/_/config/params.dart';
import 'cycle/delete.dart';
import 'cycle/init.dart';
import 'vm.dart';

class NewVMUtil {
  //vm 등록
  static registeredVM(NewParams params, {bool? permanent, String? tag}) {
    if (!Get.isRegistered<NewUtilVM>(tag: tag)) {
      var _ =
          Get.put(NewUtilVM(tag: tag), permanent: permanent ?? true, tag: tag);
    }
    if (!Get.isRegistered<NewVM>(tag: tag)) {
      var _ = Get.put(NewVM(Get.find<NewUtilVM>(tag: tag)),
          permanent: permanent ?? true, tag: tag);
      initVm(params, tag: tag);
    }
  }

  static NewVM vm({String? tag}) {
    return Get.find<NewVM>(tag: tag);
  }

  static delete({String? tag}) {
    Get.delete<NewUtilVM>(tag: tag, force: true);
    Get.delete<NewVM>(tag: tag, force: true);
    deleteVm(tag: tag);
  }
}

class NewUtilVM extends GetxController {
  NewUtilVM({this.tag});

  notify() {
    NewVM vm = NewVMUtil.vm(tag: tag);
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
