import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../new_item/widget/_/util/view_skeleton.dart';
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
      builder: (vmNew) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(tr("앱 사용을 위해 권한을 허용해주세요"))
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.w800)
                  .fontSize(20),
              Gap(5),
              Text(tr("꼭 필요한 권한만 받아요"))
                  .textStyle(Theme.of(context).textTheme.titleLarge!)
                  .fontWeight(FontWeight.w800)
                  .fontSize(20),
              Gap(50),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.phone,
                      permissionTitle: tr("전화"),
                      permissionDescription: tr("전화번호를 읽고 친구계정을 추가합니다."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.contacts,
                      permissionTitle: tr("주소록"),
                      permissionDescription: tr(
                          "연락처에 저장된 사람들에게 무료로 송금하고, 프로필 사진을 불러오고, 다양한 혜택 제공을 위해 초대 메시지를 보낼 수 있습니다. 이를 위해 연락처 정보를 토스 서버에 최신으로 동기화합니다."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.folder,
                      permissionTitle: tr("저장공간"),
                      permissionDescription:
                          tr("공동인증서로 로그인하고, 송금확인증이나 QR코드를 저장합니다."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Boxicons.bxs_chat,
                      permissionTitle: tr("알림"),
                      permissionDescription: tr("새로운 친구가 MBTI 를 등록했을때 알려줘요."))),
              NewItemView(
                  params: NewItemParams(
                      icon: Icons.track_changes,
                      permissionTitle: tr("앱추적"),
                      permissionDescription: tr(
                          "앱과 서버를 유지하기 위해 개인화된 광고를 앱 사용에 방해하지 않는 방식으로 보여줍니다."))),
              Gap(20),
              MaterialButton(
                      onPressed: () {},
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("로그인")
                          .textStyle(Theme.of(context).textTheme.bodyLarge!)
                          .textColor(Colors.white))
                  .width(1.sw)
                  .height(60),
            ],
          ),
        ),
      ),
    );
  }
}

main() async {
  return await startApp(
      home: SafeArea(
    child: NewView(
      tag: "someTag",
      params: NewParams(
        onTap: (context) {
          print("onTap");
        },
      ),
    ),
  ));
}
