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
  final NewItemColumnButton2Params params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemColumnButton2VM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItemColumnButton2) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text("Add to favorites")
                .fontSize(TEXT_SIZE)
                .fontWeight(FontWeight.w500)
                .center(),
          )
              .height(65)
              .decorated(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RADIUS_BUTTON),
                      topRight: Radius.circular(RADIUS_BUTTON)),
                  color: Colors.grey.withOpacity(OPACITY))
              .gestures(onTap: () {
            Navigator.of(context).pop();
          }),
          Container().height(1).backgroundColor(Colors.grey.withOpacity(0.4)),
          Container(
            child: Text("Hide")
                .fontSize(TEXT_SIZE)
                .fontWeight(FontWeight.w500)
                .center(),
          )
              .height(65)
              .decorated(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(RADIUS_BUTTON),
                      bottomRight: Radius.circular(RADIUS_BUTTON)),
                  color: Colors.grey.withOpacity(OPACITY))
              .gestures(onTap: () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemColumnButton2View(
      tag: "someTag",
      params: NewItemColumnButton2Params(),
    ),
  ));
}
