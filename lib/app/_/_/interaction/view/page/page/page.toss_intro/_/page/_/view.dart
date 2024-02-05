import 'dart:async';

import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:infinite_listview/infinite_listview.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../vm/_/vm.dart';
import 'config/params.dart';
import 'util/navigator.dart';
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
    List<Tuple3<String, String, String>> introData = [];

    introData.add(
        Tuple3(Assets.illu.money.path, "${tr("숨은 보험금")}\n${tr("찾기")}", ""));
    introData.add(
        Tuple3(Assets.illu.money2.path, "${tr("평생")}\n${tr("송금 무료")}", ""));
    introData.add(Tuple3(Assets.illu.bank.path, tr("토스뱅크"), tr("1금융권 은행")));
    introData.add(
        Tuple3(Assets.illu.hospital.path, "${tr("병원비")}\n${tr("돌려받기")}", ""));
    introData.add(
        Tuple3(Assets.illu.vaccine.path, "${tr("무료")}\n${tr("백신보험")}", ""));
    introData.add(
        Tuple3(Assets.illu.money4.path, "${tr("정부지원금")}\n${tr("찾기")}", ""));
    introData.add(Tuple3(Assets.illu.stock.path, "토스증권\n주식을 간편하게", ""));
    introData.add(Tuple3(Assets.illu.money.path, "숨은 보험금\n찾기", ""));
    introData.add(Tuple3(Assets.illu.money.path, "숨은 보험금\n찾기", ""));
    introData.add(Tuple3(Assets.illu.money.path, "숨은 보험금\n찾기", ""));

    return GetBuilder<NewVM>(
      tag: widget.tag,
      autoRemove: false,
      builder: (vmNew) => SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(60),
              Text(tr("금융의 모든 것"))
                  .textStyle(Theme.of(context).textTheme.headline5!)
                  .fontWeight(FontWeight.bold),
              Text(tr("토스에서 간편하게"))
                  .textStyle(Theme.of(context).textTheme.headline5!)
                  .fontWeight(FontWeight.bold),
              const Spacer(
                flex: 5,
              ),
              Container(
                height: 235,
                width: double.infinity,
                child: Stack(
                  children: [
                    _FlowListView1(
                      padding: 5,
                      itemWidget: (index) {
                        // return TossIntroStyleItem1(
                        //   context,
                        //   imageProvider: MyImageProvider1(
                        //       assetPath:
                        //       introData[index % introData.length].item1),
                        //   title: introData[index % introData.length].item2,
                        //   subTitle: introData[index % introData.length].item3,
                        // );
                        //
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(5),
                            // fit: BoxFit.contain
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      introData[index % introData.length]
                                          .item1),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // MyImage1(
                            //     imageProvider: imageProvider,
                            //     borderRadius: 10,
                            //     h: 100,
                            //     w: 120,
                            //     fit: BoxFit.contain),
                            Gap(20),
                            AutoSizeText(
                              introData[index % introData.length].item2,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              introData[index % introData.length].item3,
                            )
                                .textColor(Colors.grey)
                                .fontWeight(FontWeight.bold)
                                .textAlignment(TextAlign.center)
                                .textStyle(Theme.of(Get.context!)
                                    .textTheme
                                    .bodyText1!),
                            Gap(5),
                          ],
                        )
                            .paddingSymmetric(horizontal: 10)
                            .height(223)
                            .width(180)
                            .decorated(
                                borderRadius: BorderRadius.circular(20),
                                color: (Get.isDarkMode)
                                    ? Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .lighter(3)
                                    : Theme.of(context)
                                        .scaffoldBackgroundColor);
                      },
                      modeSpeed: 45,
                      axis: Axis.horizontal,
                      w: double.infinity,
                      h: 235,
                    ),
                    Container().height(235).width(double.infinity).decorated(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Theme.of(context).scaffoldBackgroundColor,
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.65),
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0),
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0),
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0),
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.65),
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(0)),
                  ],
                ),
              ),
              const Spacer(
                flex: 4,
              ),
              OutlinedButton(
                onPressed: () {
                  log("clicked");
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                      width: 2), // 테두리 색상과 두께 설정
                ),
                child: Text(tr("시작하기"))
                    .fontWeight(FontWeight.bold)
                    .textColor(Theme.of(context).textTheme.bodyMedium!.color!)
                    .padding(vertical: 15, horizontal: 20),
              )
                  .padding(
                    horizontal: 20,
                    vertical: 7,
                  )
                  .width(1.sw),
              // MyButtonSimple1(
              //     Text(tr("다음")).textColor(Colors.white).textStyle(
              //         Theme.of(context)
              //             .textTheme
              //             .bodyText1!
              //             .copyWith(color: Colors.white)),
              //     context, () {
              //   //클릭시 여기서 실행
              //   GetXSpell().switchTheme();
              // }, width: 0.85.sw, height: 60, borderRadius: 15),
              Gap(20),
            ],
          ),
          floatingActionButton: FloatingActionButtonKit(),
        ),
      ),
    );
  }
}

class _FlowListView1 extends StatefulWidget {
  _FlowListView1({
    super.key,
    required this.itemWidget,
    this.padding,
    this.modeSpeed,
    this.axis,
    this.h = 0,
    this.w = 0,
    this.reverseAnimationFlow = false,
  });

  final Widget Function(int) itemWidget;
  final double? padding;
  final double? modeSpeed;
  final Axis? axis; //가로 리스트뷰인지, 세로 리스트뷰인지 설정 ex) Axis.vertical,horizontal
  final double h;
  final double w;
  final bool reverseAnimationFlow;

  @override
  State<_FlowListView1> createState() => _FlowListView1State();
}

class _FlowListView1State extends State<_FlowListView1>
    with AfterLayoutMixin<_FlowListView1> {
  late Timer _timer;
  final InfiniteScrollController _scrollController = InfiniteScrollController();

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      // myLogger(timer.tick.toString());

      _scrollController.animateTo(
        _scrollController.offset +
            ((widget.modeSpeed ?? 40) *
                ((widget.reverseAnimationFlow) ? -1 : 1)),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InfiniteListView.builder(
        scrollDirection: widget.axis ?? Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        // padding: myEdgeAll(widget.padding ?? 8),
        // itemCount: widget.itemLength, //실제 데이터로 object.length 길이를 넣어줍니다.
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(widget.padding ?? 8.0),
            child: widget.itemWidget(index),
          );
        }).height(widget.h).width(widget.w);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}
}

main() async {
  return await startApp(callAfterBuild: (context) async {
    NewNavigator(NewParams(), tag: "someTag")
        .movePage(context, transition: Transition.fadeIn);
    // NewNavigator(NewParams(), tag: "someTag").movePageOffAllWithLoadingView(context);
  });
}
