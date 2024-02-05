import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../util/start_app.dart';

anonymousSignIn() async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInAnonymously();

  await FirebaseAnalytics.instance.logSignUp(signUpMethod:'anonymous_sign');
}
