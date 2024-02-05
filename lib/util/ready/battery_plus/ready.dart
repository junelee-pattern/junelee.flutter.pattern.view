import 'package:battery_plus/battery_plus.dart';

import '../../../app/_/_/interaction/listener/_/battery_state/_.dart';
import '../../../../../main.dart';

Future<void> readyForBatteryPlus() async {
  var battery = Battery();
  // Be informed when the state (full, charging, discharging) changes
  battery.onBatteryStateChanged.listen((BatteryState state) {
    BatteryStateListener(state);
  });
}
