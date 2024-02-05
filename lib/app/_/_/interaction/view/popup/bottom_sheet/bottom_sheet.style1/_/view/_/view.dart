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
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(1000),
              // color: Colors.yellowAccent,
            ),
            child: SvgPicture.asset(
              Assets.svg.instagram.follower,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyMedium!.color!,
                  BlendMode.srcIn),
            ).paddingDirectional(all: 15),
          ),
          Gap(10),
          Text(tr("로그인 후 활성화")).fontSize(20).fontWeight(FontWeight.w600),
          Gap(10),
          Text(tr("로그인후 해당 기능을 사용하실수 있습니다."))
              .fontSize(14)
              .textColor(Colors.grey),
          Gap(30),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                  width: 2), // 테두리 색상과 두께 설정
            ),
            child: Text(tr('로그인'))
                .fontWeight(FontWeight.bold)
                .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
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
