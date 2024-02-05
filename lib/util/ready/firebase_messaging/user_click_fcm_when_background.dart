import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../app/_/_/interaction/listener/_/firebase_messaging/user_click_fcm_when_background.dart';
import '../../../../../main.dart';

Future<void> readyForUserClickFcmWhenBackground() async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    UserClickFcmWhenBackgroundListener(message);
  });
}
