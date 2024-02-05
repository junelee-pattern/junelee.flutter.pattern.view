import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../../util/start_app.dart';

FirebaseLoginStateListener(User? user) async {
  log("FirebaseLoginStateListener: $user");
}
