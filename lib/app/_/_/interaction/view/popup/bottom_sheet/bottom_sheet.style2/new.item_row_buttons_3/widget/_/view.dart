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
  final NewItemRowButton3Params params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemRowButton3VM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItemRowButton3) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ios_share_outlined).iconSize(30),
              Gap(3),
              Text("공유"),
            ],
          )
              .decorated(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
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
              .decorated(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
                  color: Colors.grey.withOpacity(OPACITY))
              .backgroundColor(Colors.transparent)
              .gestures(onTap: () {
            Navigator.of(context).pop();
          }).expanded(),
          Gap(CROSS_SPACE),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.warning_amber_rounded)
                  .iconSize(30)
                  .iconColor(Colors.red),
              Gap(3),
              Text("신고").textColor(Colors.red),
            ],
          )
              .decorated(
                  borderRadius:
                      BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
                  color: Colors.grey.withOpacity(OPACITY))
              .backgroundColor(Colors.transparent)
              .gestures(onTap: () {
            Navigator.of(context).pop();
          }).expanded(),
        ],
      ).height(90),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemRowButton3View(
      tag: "someTag",
      params: NewItemRowButton3Params(),
    ),
  ));
}
