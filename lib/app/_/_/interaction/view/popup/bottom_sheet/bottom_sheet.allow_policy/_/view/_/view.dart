import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../markdown_new/page/_/util/navigator.dart';
import '../../../markdown_policy/page/_/util/navigator.dart';
import '../../vm/_/vm.dart';
import '../allow_item/util/view_skeleton.dart';
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
            children: <Widget>[
              Text(
                tr("서비스 제공을 위해 동의가 필요해요"),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
                  .textStyle(Theme.of(context).textTheme.bodyLarge!)
                  .fontWeight(FontWeight.w500),
              Row(
                children: [
                  Icon(FontAwesomeIcons.check)
                      .iconSize(15)
                      .padding(top: 3)
                      .opacity(vmNew.totalAllow ? 0.9 : 0.1),
                  Gap(15),
                  Text(
                    tr("모두 동의하기"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                      .textStyle(Theme.of(context).textTheme.bodyLarge!)
                      .fontWeight(FontWeight.w500)
                      .expanded(),
                ],
              )
                  .padding(bottom: 20, top: 30)
                  .backgroundColor(Colors.transparent)
                  .gestures(onTap: () {
                vmNew.whenClickAllAllowButton();
              }),
              Container(
                height: 0.7,
                width: double.infinity,
                color: Colors.grey,
              ).paddingDirectional(top: 0, bottom: 5).opacity(0.2),

              NewAllowItemView(
                params: NewAllowItemParams(
                  id: 0,
                  label: tr("회원 약관 및 동의사항"),
                  onTap: () {},
                  detailPageOnTap: () {
                    NewMarkdownTempleteNavigator(NewMarkdownTempleteParams())
                        .movePage(context);
                  },
                ),
              ),
              NewAllowItemView(
                params: NewAllowItemParams(
                  id: 1,
                  label: tr("개인정보 식별번호 처리 동의사항"),
                  onTap: () {},
                  detailPageOnTap: () {
                    NewMarkdownPolicyNavigator(NewMarkdownPolicyParams())
                        .movePage(context);
                  },
                ),
              ),
              NewAllowItemView(
                params: NewAllowItemParams(
                  id: 2,
                  label: tr("새로운 내용 있을시 추가 / 없을시 이걸 지워주세요."),
                  onTap: () {},
                  detailPageOnTap: () {
                    NewMarkdownTempleteNavigator(NewMarkdownTempleteParams())
                        .movePage(context);
                  },
                ),
              ),

              // _tossStyleTermServiceAgreeBottomSheetItem(
              //   // isChecked: viewModel.ItemAllows[0],
              //     viewModel: viewModel,
              //     id: 0,
              //     label: tr("회원 약관 및 동의사항"),
              //     onTap: () {
              //       // viewModel.itemClick(0);
              //     },
              //     detailPageOnTap: () {
              //       Get.to(
              //           TermMarkDownPage(
              //               pageTitle: tr("회원 약관 및 동의사항")),
              //           transition: Transition.rightToLeft);
              //     }),
              // _tossStyleTermServiceAgreeBottomSheetItem(
              //   // isChecked: viewModel.ItemAllows[2],
              //     viewModel: viewModel,
              //     id: 1,
              //     label: tr("개인정보 식별번호 처리 동의사항"),
              //     onTap: () {
              //       // viewModel.itemClick(2);
              //     },
              //     detailPageOnTap: () {
              //       Get.to(
              //           PolicyMarkDownPage(
              //               pageTitle: tr("개인정보 식별번호 처리 동의사항")),
              //           transition: Transition.rightToLeft);
              //     }),
              // _tossStyleTermServiceAgreeBottomSheetItem(
              //   // isChecked: viewModel.ItemAllows[0],
              //     viewModel: viewModel,
              //     id: 2,
              //     label: tr("새로운 내용 있을시 추가 / 없을시 이걸 지워주세요."),
              //     onTap: () {
              //       // viewModel.itemClick(0);
              //     },
              //     detailPageOnTap: () {
              //       Get.to(
              //           TermMarkDownPage(
              //               pageTitle: tr("새 내용")),
              //           transition: Transition.rightToLeft);
              //     }),
              Gap(20),

              MaterialButton(
                      onPressed: () {
                        if (!vmNew.totalAllow) {
                          vmNew.whenClickAllAllowButton();
                        } else {
                          if (vmNew.totalAllow) {
                            Navigator.pop(context);
                            widget.params.onTapWhenPassAll.call();
                            // Get.back();
                          }
                        }
                      },
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(tr("다음"))
                          .textStyle(Theme.of(context).textTheme.bodyLarge!)
                          .textColor(Colors.white))
                  .width(1.sw)
                  .height(60)
                  .opacity(vmNew.totalAllow ? 1 : 0.3),
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
      params: NewParams(),
    ),
  ));
}
