import 'dart:async';

import '../../../../../../../../../../../util/start_app.dart';
import 'util.dart';

class NewVM extends GetxController {
  /// write your variables here.
  bool totalAllow = false;
  List<bool> ItemAllows = [];
  int itemCount = 3; // <- 몇개의 선택항목이 있는지 체크

  itemClick(int id) {
    ItemAllows[id] = !ItemAllows[id];
    checkAllAllow();
    update();
  }

  checkAllow2() {
    //전체 동의인경우 모두 체크하게 만들어기 위해서
    if (totalAllow) {
      for (var i = 0; i < ItemAllows.length; i++) {
        ItemAllows[i] = true;
      }
    }
  }

  checkAllAllow() {
    log(ItemAllows);
    for (var element in ItemAllows) {
      if (!element) {
        totalAllow = false;
        return;
      }
    }
    totalAllow = true;
  }

  whenClickAllAllowButton() {
    ItemAllows = [];
    for (var i = 0; i < itemCount; i++) {
      ItemAllows.add(!totalAllow);
    }
    totalAllow = !totalAllow;
    update();
  }

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
