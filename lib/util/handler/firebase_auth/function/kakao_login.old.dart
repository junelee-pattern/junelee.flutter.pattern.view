// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
//
// import '../../ready_listener.dart';
//
//
// Future<UserCredential> signInWithKaKao() async {
//   final clientState = Uuid().v4();
//   final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
//     'response_type': 'code',
//     'client_id': "$kakaoLoginClientId",
//     'response_mode': 'form_post',
//     'redirect_uri':
//     '$kakaoLoginRedirectUri',
//     'scope': 'account_email',
//     'state': clientState,
//   });
//
//   final result = await FlutterWebAuth.authenticate(
//       url: url()String(),
//       callbackUrlScheme: "webauthcallback"); //"applink"//"signinwithapple"
//   final body = Uri.parse(result).queryParameters;
//   myLogger(body["code"]);
//
//   final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
//     'grant_type': 'authorization_code',
//     'client_id': "$kakaoLoginClientId",
//     'redirect_uri':
//     '$kakaoLoginRedirectUri',
//     'code': body["code"],
//   });
//   var responseTokens = await http.post(tokenUrl);
//   Map<String, dynamic> bodys = json.decode(responseTokens.body);
//   var response = await http.post(
//       Uri.parse(kakaoLoginCallbacksTokenUrl) ,
//       body: {"accessToken": bodys['access_token']});
//   return FirebaseAuth.instance.signInWithCustomToken(response.body);
// }
