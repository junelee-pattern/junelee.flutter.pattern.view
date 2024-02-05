import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../config.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewItemRowButton2Params params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemRowButton2VM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItemRowButton2) =>
          Row(mainAxisSize: MainAxisSize.max, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ios_share_outlined).iconSize(30),
            Gap(3),
            Text("공유"),
          ],
        )
            .height(80)
            .decorated(
                borderRadius: BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
                color: Colors.grey.withOpacity(OPACITY))
            .backgroundColor(Colors.transparent)
            .gestures(onTap: () {
          Navigator.of(context).pop();
        }).expanded(),
        Gap(CROSS_SPACE),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.link).iconSize(30),
            Gap(3),
            Text("링크"),
          ],
        )
            .height(80)
            .decorated(
                borderRadius: BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
                color: Colors.grey.withOpacity(OPACITY))
            .backgroundColor(Colors.transparent)
            .gestures(onTap: () {
          Navigator.of(context).pop();
        }).expanded()
      ]).height(80),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemRowButton2View(
      tag: "someTag",
      params: NewItemRowButton2Params(),
    ),
  ));
}
