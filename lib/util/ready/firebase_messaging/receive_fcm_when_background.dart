import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../app/_/_/interaction/listener/_/firebase_messaging/receive_fcm_when_background.dart';
import '../../../../../main.dart';
import '../../config/isolate.dart';

Future<void> readyForReceiveFcmWhenBackground() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await ReadyAppIsolateEnvironmentConfig().call();

  ReceiveFcmWhenBackgroundListener(message);
}
