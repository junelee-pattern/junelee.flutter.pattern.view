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
      autoRemove: false,
      builder: (vmNew) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(30),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(1000),
              // color: Colors.yellowAccent,
            ),
            child:
                SvgPicture.asset(Assets.svg.remove).paddingDirectional(all: 25),
          ),
          Gap(10),
          Text(tr("에러 발생")).fontSize(20).fontWeight(FontWeight.w600),
          Gap(10),
          Text(tr("에러가 발생했습니다. \n홈페이지에서 다시 시도해주세요."))
              .textAlignment(TextAlign.center)
              .fontSize(14)
              .textColor(Colors.grey),
          Gap(30),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(color: Colors.black, width: 2), // 테두리 색상과 두께 설정
            ),
            child: Text(tr('홈으로'))
                .fontWeight(FontWeight.bold)
                .textColor(Colors.black)
                .padding(vertical: 15, horizontal: 20),
          ),
          Gap(30),
        ],
      ).backgroundColor(Theme.of(context).colorScheme.background),
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
