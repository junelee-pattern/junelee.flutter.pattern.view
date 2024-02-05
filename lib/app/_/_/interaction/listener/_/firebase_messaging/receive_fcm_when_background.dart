import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../../util/start_app.dart';

ReceiveFcmWhenBackgroundListener(RemoteMessage message) async {
  log('ReceiveFcmWhenBackgroundListener: ${message.data}');
}
