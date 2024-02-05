import 'package:flutter/cupertino.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../di.dart';
import 'function/anonymous_sign.dart';
import 'function/apple_login.dart';
import 'function/apple_login_android.dart';
import 'function/apple_login_v2.dart';
import 'function/email_password_login.dart';
import 'function/email_send_auth.dart';
import 'function/facebook_login.dart';
import 'function/google_login.dart';
import 'function/kakao_login.dart';

// https://pub.dev/packages/firebase_auth
class FirebaseAuthKit {
  bool isLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  String? getUid() {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    }
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  anonymousLoginIn() async {
    if (checkAlreadyLogin()) return;
    await anonymousSignIn();
  }

  emailLogin(
      {required String email,
        String? emailLink,
        int? minimumBuildNumber,
        String? languageCode}) async {
    if (checkAlreadyLogin()) return;
    await emailSendAuth(
        email: email,
        emailSingUpLink: emailLink ?? emailSingUpLink,
        minimumBuildNumber: minimumBuildNumber,
        languageCode: languageCode);
  }

  String getWaitingEmailAddress() {
    return GetStorageKit().getString("p-firebase_auth_email");
  }

  Function(String deeplink) emailSendAuthVerifyApi = emailSendAuthVerify;

  Future<bool> emailPasswordSignIn(
      {required String email, required String password}) async {
    return await emailPasswordSignInFunction(email: email, password: password);
  }

  Future<bool> emailPasswordLogin(
      {required String email, required String password}) async {
    return await emailPasswordLoginFunction(email: email, password: password);
  }

  Future<String> getIdToken({bool? onlyOneLogin}) async {
    if (FirebaseAuth.instance.currentUser == null) return "";
    return await FirebaseAuth.instance.currentUser!.getIdToken() ?? "";
  }

  googleLogin({List<String>? scope, bool? force}) async {
    if (checkAlreadyLogin() && !(force ?? false)) return;
    await signInWithGoogle(scope: scope);
  }

  // facebookLogin() {
  //   if (checkAlreadyLogin()) return;
  //   signInWithFacebook();
  // }

  appleLogin() async {
    if (checkAlreadyLogin()) return;
    await signInWithApple();
    // if (Platform.isIOS) {
    //   signInWithApple();
    // } else {
    //   signInWithAppleInAndroid(
    //       appleLoginClientId: appleLoginClientId,
    //       appleLoginCallBackUrl: appleLoginCallBackUrl);
    // }
  }

  appleLoginFirebaseVer() async {
    final appleProvider = AppleAuthProvider();
    await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }

  kakaoLogin({required String kakaoLoginCallbacksTokenUrl}) {
    if (checkAlreadyLogin()) return;
    signInWithKaKao(kakaoLoginCallbacksTokenUrl: kakaoLoginCallbacksTokenUrl);
  }

  bool checkAlreadyLogin() {
    if (FirebaseAuth.instance.currentUser != null) {
      // GetXSpell.to.snapBar(title: '중복로그인',subTitle: '현재 로그인되어있습니다. 새로 로그인을 원하실경우 로그아웃후 재 로그인해주세요.');
      return true;
    }
    return false;
  }

  // Future<bool> phoneLogin(
  //     String phoneNumber, String countryCode, BuildContext context) async {
  //   if (!await LibPhoneNumberSpell()
  //       .verifyPhoneNumber(phoneNumber, countryCode)) {
  //     GetXSpell.to.snapBar(
  //         title: tr("알림"), subTitle: tr('잘못된 전화번호 형식입니다. 전화번호를 다시 입력해주세요.'));
  //     return false;
  //   } else {
  //     phoneSignIn(phoneNumber, countryCode, context);
  //     return true;
  //   }
  // }
  //
  // Future<bool> phoneLoginVerify(String smsCode) async {
  //   try {
  //     await verifySMSForPhoneSignIn(smsCode);
  //     return true;
  //   } catch (e) {
  //     e.printError();
  //     return false;
  //   }
  // }

  loginSample1() async {
    bool success = await emailPasswordSignIn(
        email: "test111@gmail.com", password: "fegreqgfsdfefqw");
    if (!success) {
      emailPasswordLogin(
          email: "test111@gmail.com", password: "fegreqgfsdfefqw");
    }
  }

  loginSample2() async {
    bool success = await emailPasswordSignIn(
        email: "test112@gmail.com", password: "fegreqgfsdfefqw");
    if (!success) {
      emailPasswordLogin(
          email: "test112@gmail.com", password: "fegreqgfsdfefqw");
    }
  }

  loginSample3() async {
    bool success = await emailPasswordSignIn(
        email: "test113@gmail.com", password: "fegreqgfsdfefqw");
    if (!success) {
      emailPasswordLogin(
          email: "test113@gmail.com", password: "fegreqgfsdfefqw");
    }
  }

  loginSample4() async {
    bool success = await emailPasswordSignIn(
        email: "test114@gmail.com", password: "fegreqgfsdfefqw");
    if (!success) {
      emailPasswordLogin(
          email: "test114@gmail.com", password: "fegreqgfsdfefqw");
    }
  }
}
