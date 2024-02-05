import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigConfig {
  Future<void> call() async {
    await FirebaseRemoteConfig.instance.setDefaults(const {
      "example_param_1": 42,
      "example_param_2": 3.14159,
      "example_param_3": true,
      "example_param_4": "Hello, world!",
    });
  }
}
