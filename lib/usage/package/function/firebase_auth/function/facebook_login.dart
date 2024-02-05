// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// import '../../../../../util/start_app.dart';
//
// Future<UserCredential?> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();
//
//   // if(loginResult.accessToken == null){
//   //   return null;
//   // }
//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//   await FirebaseAnalytics.instance.logSignUp(signUpMethod:'facebook_login');
//
//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
