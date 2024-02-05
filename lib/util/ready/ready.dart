import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../main.dart';
import '../start_app.dart';

readyForRunAppStart() async {
  if (_readyForRunAppStart) return;
  _readyForRunAppStart = true;

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}

readyForMaterialAppStart() async {
  if (_readyForMaterialAppStart) return;
  _readyForMaterialAppStart = true;

  screenRotateConfig();
}

readyForAppStart(BuildContext context) async {
  if (_readyForAppStart) return;
  _readyForAppStart = true;
}

bool _readyForRunAppStart = false;
bool _readyForMaterialAppStart = false;
bool _readyForAppStart = false;
