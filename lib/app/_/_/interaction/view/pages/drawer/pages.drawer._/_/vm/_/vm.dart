import 'dart:async';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../../../../../../../../util/start_app.dart';
import 'util.dart';

class NewVM extends GetxController {
  /// write your variables here.

  final zoomDrawerController = ZoomDrawerController();

  /// basic
  NewUtilVM util;

  NewVM(this.util);
}
