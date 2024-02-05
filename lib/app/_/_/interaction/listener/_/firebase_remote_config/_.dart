import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../../../../../util/start_app.dart';

FirebaseRemoteConfigListener() async {
  log('FirebaseRemoteConfigListener');

  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  int example_param_1 = remoteConfig.getInt('example_param_1');
  double example_param_2 = remoteConfig.getDouble('example_param_2');
  bool example_param_3 = remoteConfig.getBool('example_param_3');
  String example_param_4 = remoteConfig.getString('example_param_4');
}
