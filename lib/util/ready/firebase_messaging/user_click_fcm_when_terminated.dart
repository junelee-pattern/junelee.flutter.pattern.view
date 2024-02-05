import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../app/_/_/interaction/listener/_/firebase_messaging/user_click_fcm_when_terminated.dart';
import '../../../../../main.dart';

Future<void> readyForUserClickFcmWhenTerminated() async {
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    UserClickFcmWhenTerminatedListener(initialMessage);
  }
}
