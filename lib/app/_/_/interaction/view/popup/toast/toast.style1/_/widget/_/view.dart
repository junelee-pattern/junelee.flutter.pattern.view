import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
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
        autoRemove: true,
        builder: (vmNew) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text("내 위시 리스트에 추가되었습니다!")
                        .textColor(Colors.white)
                        .fontWeight(FontWeight.bold)
                        .padding(horizontal: 30, vertical: 15)),
              ],
            ));
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
