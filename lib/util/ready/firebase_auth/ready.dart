import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/_/_/interaction/listener/_/firebase_first_time_login/_.dart';
import '../../../app/_/_/interaction/listener/_/firebase_login_state/_.dart';
import '../../start_app.dart';

Future<void> readyForFirebaseAuth() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      // log('User is currently signed out!');

      FirebaseLoginStateListener(user);
    } else {
      // log('User is signed in!:${user.email}');

      FirebaseLoginStateListener(user);

      //check first time login
      if (!GetStorageKit().getBool('p-firebase_auth_first_time_login')) {
        GetStorageKit().setBool('p-firebase_auth_first_time_login', true);

        FirebaseFirstTimeLoginListener();
      }

      /// possible email login, so delete email value.
      GetStorageKit().setString("p-firebase_auth_email", '');
    }
  });
}
