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
  final NewItemSingleButtonParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemSingleButtonVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItemSingleButton) => Container(
        child: Text(tr("이 게시물이 표시되는 이유"))
            .fontSize(TEXT_SIZE)
            .fontWeight(FontWeight.w500)
            .center(),
      )
          .height(65)
          .decorated(
              borderRadius: BorderRadius.all(Radius.circular(RADIUS_BUTTON)),
              color: Colors.grey.withOpacity(OPACITY))
          .gestures(onTap: () {
        Navigator.of(context).pop();
      }),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemSingleButtonView(
      tag: "someTag",
      params: NewItemSingleButtonParams(),
    ),
  ));
}
