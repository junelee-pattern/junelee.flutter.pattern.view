import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../app/_/_/interaction/listener/_/connectivity_state/_.dart';
import '../../../../../main.dart';

Future<void> readyForConnectivityPlus() async {
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    ConnectivityStateListener(result);
  });
}
