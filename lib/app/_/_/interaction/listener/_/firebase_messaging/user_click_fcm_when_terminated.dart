import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../../util/start_app.dart';

UserClickFcmWhenTerminatedListener(RemoteMessage message) async {
  log('UserClickFcmWhenTerminatedListener: ${message.data}');
}
