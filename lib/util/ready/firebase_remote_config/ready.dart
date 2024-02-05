import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../app/_/_/interaction/listener/_/firebase_remote_config/_.dart';
import '../../config/firebase_remote_config.dart';
import '../../start_app.dart';

Future<void> readyForFirebaseRemoteConfig() async {
  await FirebaseRemoteConfigConfig()();
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 2),
    minimumFetchInterval: const Duration(days: 1),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await FirebaseRemoteConfigListener();
}
