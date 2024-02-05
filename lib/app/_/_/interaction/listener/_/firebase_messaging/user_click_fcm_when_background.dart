import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../../util/start_app.dart';

UserClickFcmWhenBackgroundListener(RemoteMessage message) async {
  log('UserClickFcmWhenBackgroundListener: ${message.data}');
}
