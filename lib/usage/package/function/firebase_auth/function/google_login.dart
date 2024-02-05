import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../util/start_app.dart';

Future<UserCredential?> signInWithGoogle({List<String>? scope}) async {
  // Trigger the authentication flow
  GoogleSignInAccount? googleUser;
  if (scope != null) {
    googleUser = await GoogleSignIn(scopes: scope).signIn();
  } else {
    googleUser = await GoogleSignIn().signIn();
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
