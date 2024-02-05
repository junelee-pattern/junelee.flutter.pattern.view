import 'package:flutter/material.dart';

import '../../../../../../../../util/start_app.dart';
import '_/widget/_/util/view_skeleton.dart';

void NewSnackBar(BuildContext context, int duration) async {
  final snackBar = SnackBar(
    content: NewView(
      tag: "newtag",
      params: NewParams(),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.fixed,
    // 고정된 스낵바 행동
    duration: Duration(seconds: duration),
    // margin 속성은 생략
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
