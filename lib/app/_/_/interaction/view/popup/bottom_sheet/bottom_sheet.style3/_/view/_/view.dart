import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../item/widget/_/util/view_skeleton.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/view_skeleton.dart';

class V extends StatefulWidget {
  const V({super.key, this.heroKey, this.tag, required this.params});

  final Key? heroKey;
  final String? tag;
  final NewParams params;

  @override
  State<V> createState() => _VState();
}

class _VState extends State<V> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewItemView(
              params: NewItemParams(
            icon: Icons.settings,
            buttonText: tr("설정"),
            onPressed: (context) async {},
          )),
          NewItemView(
            params: NewItemParams(
              icon: Icons.shopping_bag_outlined,
              buttonText: tr("Shop"),
              onPressed: (context) async {},
            ),
          ),
          NewItemView(
            params: NewItemParams(
              icon: Icons.timelapse_rounded,
              buttonText: tr("내 활동"),
              onPressed: (context) async {},
            ),
          ),
          NewItemView(
            params: NewItemParams(
              icon: Icons.history,
              buttonText: tr("보관"),
              onPressed: (context) async {},
            ),
          ),
          NewItemView(
            params: NewItemParams(
              icon: Icons.qr_code_2,
              buttonText: tr("QR 코드"),
              onPressed: (context) async {},
            ),
          ),
          Gap(20),
        ],
      ).padding(vertical: 20, horizontal: 20),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewView(
      tag: "someTag",
      params: NewParams(),
    ),
  ));
}
