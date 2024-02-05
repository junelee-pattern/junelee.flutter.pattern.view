import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../../../../../util/start_app.dart';

//이메일 확인 로그인을 사용하기 위해서 firebase_dynamic_links 가 필요합니다. 해당하는 컴포넌트를 찾아서 적용해주세요.
emailSendAuth(
    {required String email,
    required String emailSingUpLink,
    int? minimumBuildNumber,
    String? languageCode}) async {
  // await FirebaseAuthTable.keyValueDb.setEmailVerifyLogin(email);
  GetStorageKit().setString("p-firebase_auth_email", email);

  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.sample_app.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: emailSingUpLink,
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: MyPackageInfo.version,
      androidPackageName: MyPackageInfo.packageName,
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: minimumBuildNumber?.toString());

  // String emailAuth = await FirebaseAuthTable.keyValueDb.getEmailVerifyLogin();
  String emailAuth = GetStorageKit().getString("p-firebase_auth_email");

  var auth = FirebaseAuth.instance;
  await auth.setLanguageCode(languageCode ??
      Intl.getCurrentLocale().substring(0, 2)); //여기서 탬플릿 언어 맞춰줍니다.
  auth
      .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
      .catchError((onError) => log('Error sending email verification $onError'))
      .then((value) => log('Successfully sent email verification'));
}

emailSendAuthVerify(String emailLink) async {
  var auth = FirebaseAuth.instance;
// Retrieve the email from wherever you stored it
//   String emailAuth = await FirebaseAuthTable.keyValueDb.getEmailVerifyLogin();
  String emailAuth = GetStorageKit().getString("p-firebase_auth_email");

// Confirm the link is a sign-in with email link.
  if (auth.isSignInWithEmailLink(emailLink)) {
    // The client SDK will parse the code from the link for you.
    auth
        .signInWithEmailLink(email: emailAuth, emailLink: emailLink)
        .then((value) {
      // You can access the new user via value.user
      // Additional user info profile *not* available via:
      // value.additionalUserInfo.profile == null
      // You can check if the user is new or existing:
      // value.additionalUserInfo.isNewUser;
      var userEmail = value.user;
      log('Successfully signed in with email link!');

      FirebaseAnalytics.instance.logSignUp(signUpMethod:'email_login');
    }).catchError((onError) {
      log('Error signing in with email link $onError');
    });
  }
}
