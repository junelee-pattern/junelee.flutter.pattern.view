import 'dart:io';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'user_action/click_add_photo_button.dart';
import 'user_action/click_close_photo_item_button.dart';
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
          Divider(
            height: 1,
            thickness: 1,
          ),
          (vmNew.photos.isNotEmpty)
              ? Container(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    itemCount: vmNew.photos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          //round image file
                          child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 1, // 이미지 비율을 1:1로 유지 (필요에 따라 조정)
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              // 이미지 모서리 둥글게
                              child: Image.file(
                                File(vmNew.photos[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Material(
                              color: Colors.transparent,
                              // 배경을 투명하게 설정합니다.
                              shape: CircleBorder(),
                              // 원형 아웃라인을 만듭니다.
                              clipBehavior: Clip.hardEdge,
                              // 재질의 모양에 맞춰 자식 위젯을 잘라냅니다.
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      width: 2), // 아웃라인 설정
                                  color: Colors.grey, // 아이콘 배경색
                                  shape: BoxShape.circle,
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  // 물결 효과의 범위를 원형으로 설정합니다.
                                  onTap: () {
                                    clickClosePhotoItemButtonUserAction(
                                      context,
                                      index,
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    // 아이콘과 아웃라인 사이의 간격을 설정합니다.
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )).paddingSymmetric(horizontal: 5, vertical: 10);
                    },
                  ),
                )
              : Container(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              vmNew.enableSendButton
                  ? Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .color!
                            .withOpacity(0.6),
                      ),
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Colors.white,
                      ),
                    ).gestures(onTap: () {
                      clickAddPhotoButtonUserAction(
                        context,
                      );
                    })
                  : CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(Assets.image.iu.path),
                    ),
              Gap(10),
              Expanded(
                // Flexible 또는 Expanded 사용
                child: TextFormField(
                  focusNode: vmNew.focusNode,
                  controller: vmNew.textEditingController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  // 최소 시작 줄 수
                  maxLines: 4,
                  // 최대 확장될 수 있는 줄 수
                  decoration: InputDecoration(
                    hintMaxLines: 1,
                    hintText: '${widget.params.userName}님께 마음 전하기',

                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // Padding 조절
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: vmNew.enableSendButton
                      ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withOpacity(0.8)
                      : Colors.grey.withOpacity(0.5),
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ).padding(horizontal: 10, vertical: 10),
        ],
      ),
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
