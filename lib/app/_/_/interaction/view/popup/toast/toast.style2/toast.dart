import 'package:flutter/material.dart';

import '../../../../../../../../util/start_app.dart';
import '_/widget/_/util/view_skeleton.dart';

void NewToast(BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: Alignment.bottomCenter, // 화면 하단 중앙에 배치
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Material(
          color: Colors.transparent,
          child: NewView(
            params: NewParams(),
            tag: "newtag",
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
