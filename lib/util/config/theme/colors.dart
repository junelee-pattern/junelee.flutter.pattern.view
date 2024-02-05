import 'package:flutter/material.dart';

import '../../start_app.dart';
import '_config.dart';

class ThemeColorScheme {
  // Color(0xFF601410),//
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: Color(0xFFFFD8E4), // 주요 색상 지정
    background: Colors.white, // 라이트 모드의 배경색
    onBackground: Colors.black, // 라이트 모드에서 배경 위의 글자색
  );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: Color(0xFFFFD8E4), // 주요 색상 지정
    brightness: Brightness.dark, // 다크 모드 설정
    background: Colors.black, // 다크 모드의 배경색
    onBackground: Colors.white, // 다크 모드에서 배경 위의 글자색
  );

  static Color dialogBackgroundColor = Colors.white;
  static Color dialogDarkBackgroundColor = Colors.black;
}
