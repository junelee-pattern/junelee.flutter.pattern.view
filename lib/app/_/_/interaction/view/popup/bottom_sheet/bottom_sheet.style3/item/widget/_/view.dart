import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'user_action/click_button.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewItemParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewItemVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNewItem) => Row(
        children: [
          Icon(widget.params.icon),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.params.buttonText,
                  )
                      .fontSize(16)
                      .textAlignment(TextAlign.start)
                      .backgroundColor(Colors.transparent)
                ],
              ).expanded(),
              Container()
                  .height(1)
                  .backgroundColor(Colors.grey.withOpacity(0.15)),
            ],
          ).expanded(),
        ],
      ).height(55).backgroundColor(Colors.transparent).gestures(onTap: () {
        clickButtonUserAction(context, widget.params.onPressed);
      }),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewItemView(
        tag: "someTag",
        params: NewItemParams(
          icon: Icons.add,
          buttonText: "New Item View",
          onPressed: (context) async {},
        )),
  ));
}
