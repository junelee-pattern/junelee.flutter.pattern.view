import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../app/_/_/interaction/listener/_/firebase_messaging/receive_fcm_when_foreground.dart';
import '../../../../../main.dart';

Future<void> readyForReceiveFcmWhenForeground() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    ReceiveFcmWhenForegroundListener(message);
  });
}
