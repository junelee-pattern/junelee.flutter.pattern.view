import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

Future<UserCredential> signInWithNaver() async {
  final clientState = const Uuid().v4();
  final url = Uri.https('nid.naver.com', '/oauth2.0/authorize', {
    'response_type': 'code',
    'client_id': "<네이버에서 제공하는 Client_id 입력>",
    'redirect_uri': '<네이버에 등록한 authrization_code 받을 return uri 입력>',
    'state': clientState,
  });

  final result = await FlutterWebAuth.authenticate(
      url: url.toString(), callbackUrlScheme: "webauthcallback");
  final body = Uri.parse(result).queryParameters;

  final tokenUrl = Uri.https('nid.naver.com', '/oauth2.0/token', {
    'grant_type': 'authorization_code',
    'client_id': "<네이버에서 제공하는 Client_id 입력>",
    'client_secret': "<네이버에서 제공하는 Client Secret 입력>",
    'code': body["code"],
    'state': clientState,
  });
  var responseTokens = await http.post(tokenUrl);
  Map<String, dynamic> bodys = json.decode(responseTokens.body);
  var response = await http.post(
      Uri.parse("https://sage-dorian-anise.glitch.me/callbacks/naver/token"),
      body: {"accessToken": bodys['access_token']});
  return FirebaseAuth.instance.signInWithCustomToken(response.body);
}
