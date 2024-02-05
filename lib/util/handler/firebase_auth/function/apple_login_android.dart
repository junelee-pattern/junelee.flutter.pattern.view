// import 'dart:convert';
// import 'dart:math';
//
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
// import '../util/start_app.dart';
//
// Future<UserCredential> signInWithAppleInAndroid({required String appleLoginClientId,required String appleLoginCallBackUrl,}) async {
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//     webAuthenticationOptions: WebAuthenticationOptions(
//       clientId: appleLoginClientId,
//       redirectUri: Uri.parse(
//           appleLoginCallBackUrl),
//     ),
//   );
//
//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     accessToken: appleCredential.authorizationCode,
//   );
//
//   await FirebaseAnalytics.instance.logSignUp(signUpMethod:'apple_login');
//
//   return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
// }
