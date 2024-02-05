// import 'package:flutter/material.dart';
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../../flutter_easy_loading/spell.dart';
// import '../main/data/respository/database/firebase_auth/local_key_impl.dart';
// import '../../../../util/start_app.dart';
//
// phoneSignIn(String phoneNumber,String countryCode,BuildContext context) async {
//   log('phoneNumber:$phoneNumber');
//   log('countryCode:$countryCode');
//
//
//   // FirebaseAuthTable.keyValueDb.setMyCountryDialCode(countryCode);
//   FirebaseAuthLocalKeyDb().setMyCountryDialCode(countryCode);
//   // FirebaseAuthTable.keyValueDb.setMyPhoneNumber(phoneNumber);
//   FirebaseAuthLocalKeyDb().setMyPhoneNumber(phoneNumber);
//
//
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     //'+821023981952',
//     phoneNumber: phoneNumber,
//     // timeout: const Duration(seconds: 60),
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       log("run verificationCompleted");
//       FlutterEasyLoadingSpell().endLoading();
//
//       await auth.signInWithCredential(credential);
//
//       await FirebaseAnalytics.instance.logSignUp(signUpMethod:'phone_login');
//
//       // InputPhoneNumberVM().sendPhoneLogin(context);
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       log("run verificationFailed");
//       FlutterEasyLoadingSpell().endLoading();
//
//       String messageText = "";
//
//       // too-many-requests -> 너무 많은 요청. 나중에 다시 시도해주세요. 진행하자.
//       if (e.code == 'invalid-phone-number') {
//         messageText = tr('잘못된 전화번호 형식입니다. 전화번호를 다시 입력해주세요.');
//       } else if (e.code == 'too-many-requests') {
//         messageText = tr('너무 많은 요청으로 잠시 비활성화 되었습니다. 15분 뒤에 다시시도해주세요.');
//       } else {
//         messageText = tr('잘못된 요청입니다. 다시 요청해주세요.');
//         e.printError();
//       }
//       e.printError();
//
//       GetXSpell().snapBar(title: tr('알림'),subTitle: messageText);
//
//
//     },
//     codeSent: (String verificationId, int? resendToken) async {
//       log("run codeSent");
//       // FirebaseAuthTable.keyValueDb.setVerificationId(verificationId);
//       FirebaseAuthLocalKeyDb().setVerificationId(verificationId);
//       FlutterEasyLoadingSpell().endLoading();
//       // Get.find<InputPhoneNumberVM>().sendPhoneLogin(context);
//
//
//       //안드로이드만 해당됨.
//       // Update the UI - wait for the user to enter the SMS code
//       // String smsCode = 'xxxx';
//       //
//       // // Create a PhoneAuthCredential with the code
//       // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
//       //
//       // // Sign the user in (or link) with the credential
//       // await auth.signInWithCredential(credential);
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {
//       log("run codeAutoRetrievalTimeout");
//       FlutterEasyLoadingSpell().endLoading();
//
//       // GetXSpell().snapBar(title: tr('알림'),subTitle: tr("유효시간이 지났습니다. 뒤로가기를 클릭후 시도해주세요"),duration: Duration(seconds: 10));
//     },
//   );
// }
