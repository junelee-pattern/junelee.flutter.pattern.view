import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../../util/start_app.dart';

ReceiveFcmWhenForegroundListener(RemoteMessage message) async {
  log('ReceiveFcmWhenForegroundListener: ${message.data}');
}
