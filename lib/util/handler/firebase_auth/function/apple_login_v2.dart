import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../util/start_app.dart';

Future<UserCredential> signInWithApple() async {
  final _ = await _signInWithApple();
  await FirebaseAnalytics.instance.logSignUp(signUpMethod:'apple_login');
  return _;
}

Future<UserCredential> _signInWithApple() async {
  final appleProvider = AppleAuthProvider();
  if (kIsWeb) {
    return await FirebaseAuth.instance.signInWithPopup(appleProvider);
  } else {
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }
}
