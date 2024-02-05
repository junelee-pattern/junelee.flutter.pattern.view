import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../config/di.dart';
import '../config/params.dart';
import '../cycle/ready_view.dart';
import 'view_skeleton.dart';

export '../config/params.dart';

class NewNavigator {
  NewParams params;
  String? tag;

  NewNavigator(this.params, {this.tag}) {
    dependencyInjection(params, tag);
  }

  // page move without delay (hero animation not available)
  movePageWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.to(
        () => NewView(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  movePageOffWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.off(
        () => NewView(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }

  movePageOffAllWithLoadingView(BuildContext context,
      {Transition? transition, Key? heroKey}) {
    params.context = context;
    Get.offAll(
        () => NewView(
              params: params,
              tag: tag,
              heroKey: heroKey,
            ),
        transition: transition ?? Transition.rightToLeft);
  }
}
