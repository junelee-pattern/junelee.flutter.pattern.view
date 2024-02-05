import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../../../util/start_app.dart';

// bool _isKaKaoTalkInstalled = false;
// _initKaKaoTalkInstalled() async {
//   final installed = await isKakaoTalkInstalled();
//   _isKaKaoTalkInstalled = installed;
//
//   _isKaKaoTalkInstalled ? _loginWithTalk() : _loginWithKakao(kakaoLoginCallbacksTokenUrl: '');
// }

_issueAccessToken(OAuthToken token,
    {required String kakaoLoginCallbacksTokenUrl}) async {
  try {
    // OAuthToken token = await AuthApi.instance.issueAccessToken(authCode);
    log(token.accessToken);
    // log(token.accessTokenExpiresAt);
    log(token.refreshToken);
    log(token.refreshTokenExpiresAt);

    var response = await http.post(Uri.parse(kakaoLoginCallbacksTokenUrl),
        body: {"accessToken": token.accessToken});
    log(response.toString());
    log(response.body);
    FirebaseAuth.instance.signInWithCustomToken(response.body);
  } catch (e) {
    log("error on issuing access token: $e");
  }
}

_loginWithKakao({required String kakaoLoginCallbacksTokenUrl}) async {
  try {
    // var code = await AuthCodeClient.instance.request();
    // OAuthToken token = await AuthApi.instance.issueAccessToken(code);
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    await _issueAccessToken(token,
        kakaoLoginCallbacksTokenUrl: kakaoLoginCallbacksTokenUrl);
  } catch (e) {
    log(e);
  }
}

_loginWithTalk({required String kakaoLoginCallbacksTokenUrl}) async {
  try {
    var token = await UserApi.instance.loginWithKakaoTalk();
    await _issueAccessToken(token,
        kakaoLoginCallbacksTokenUrl: kakaoLoginCallbacksTokenUrl);
  } catch (e) {
    log(e);
  }
}

unlinkTalk() async {
  try {
    var code = await UserApi.instance.unlink();
    log(code.toString());
  } catch (e) {
    log(e);
  }
}

signInWithKaKao({required String kakaoLoginCallbacksTokenUrl}) async {
  await isKakaoTalkInstalled()
      ? _loginWithTalk(kakaoLoginCallbacksTokenUrl: kakaoLoginCallbacksTokenUrl)
      : _loginWithKakao(
          kakaoLoginCallbacksTokenUrl: kakaoLoginCallbacksTokenUrl);
  // _loginWithKakao();//현재 어떤 이유에선지 _loginWithTalk() 를 하면 다시 앱으로 돌아오지않는 문제가 있다. 따라서 당분간은 그냥 웹에서 하기로 결정함
  //시간이 있다면 _loginWithTalk()를 좀더 자세히 알아봐야한다.
}

// _issueAccessToken(String authCode) async {
//   try {
//     var token = await AuthApi.instance.issueAccessToken(authCode);
//     AccessTokenStore.instance()Store(token);
//     log(token);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LoginDone()),
//     );
//   } catch (e) {
//     log("error on issuing access token: $e");
//   }
// }
