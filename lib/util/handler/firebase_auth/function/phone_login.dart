import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../util/start_app.dart';

Future<void> verifySMSForPhoneSignIn(String smsCode) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  // String verificationId = await FirebaseAuthTable.keyValueDb.getVerificationId();
  String verificationId =
      GetStorageKit().getString("p-firebase_auth_email_verify_code");
  // String smsCode = '437644';

  // Create a PhoneAuthCredential with the code
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId, smsCode: smsCode);

  // Sign the user in (or link) with the credential
  await auth.signInWithCredential(credential);

  await FirebaseAnalytics.instance.logSignUp(signUpMethod:'phone_login');
}
