import 'package:flutter/material.dart';

import '../../../../../../../../util/start_app.dart';
import '_/view/_/util/view_skeleton.dart';

void NewAllowBottomSheet(BuildContext context,
    {required VoidCallback onTap}) async {
  if (GetStorageKit().getBool('NewAllowBottomSheet')) {
    onTap.call();
  } else {
    await showBarModalBottomSheet(
        // barrierColor: Colors.black54,
        //배경색
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => NewView(
              params: NewParams()
                ..onTapWhenPassAll = () async {
                  GetStorageKit().setBool('NewAllowBottomSheet', true);
                  onTap.call();
                },
            ).backgroundColor(Theme.of(context).colorScheme.background));
  }
}
