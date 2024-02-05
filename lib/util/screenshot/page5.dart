import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

import 'package:auto_app_translate/callable/core_my/my_language_code/entity/flutter_support_language_locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

class ScreenShotPage5 extends StatefulWidget {
  const ScreenShotPage5({super.key});

  @override
  State<ScreenShotPage5> createState() => _ScreenShotPage5State();
}

class _ScreenShotPage5State extends State<ScreenShotPage5> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: material.TextDirection.ltr,
      child: Material(
        child: SafeArea(
            child: Scaffold(
          body: Center(
            child: Text('${tr('hello world')} Page5'),
          ),
        )),
      ),
    );
  }
}
