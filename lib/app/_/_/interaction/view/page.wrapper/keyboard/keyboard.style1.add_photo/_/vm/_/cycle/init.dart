import 'package:flutter/material.dart';

import '../../../../../../../../../../../../util/start_app.dart';
import '../../../widget/_/config/params.dart';
import '../action/enroll_typing_listener.dart';
import '../util.dart';
import '../vm.dart';

initVm(NewParams params, {String? tag}) async {
  enrollTypingListenerAction(tag: tag);
}
