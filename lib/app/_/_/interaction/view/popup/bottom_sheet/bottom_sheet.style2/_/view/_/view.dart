import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../../../../../../../../../util/start_app.dart';
import '../../../config.dart';
import '../../../new.item_column_buttons_2/widget/_/util/view_skeleton.dart';
import '../../../new.item_column_buttons_3/widget/_/util/view_skeleton.dart';
import '../../../new.item_column_buttons_4/widget/_/util/view_skeleton.dart';
import '../../../new.item_row_buttons_2/widget/_/util/view_skeleton.dart';
import '../../../new.item_row_buttons_3/widget/_/util/view_skeleton.dart';
import '../../../new.item_single_button/widget/_/util/view_skeleton.dart';
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(5),
                  NewItemRowButton3View(params: NewItemRowButton3Params()),
                  Gap(MAIN_SPACE),
                  NewItemRowButton2View(params: NewItemRowButton2Params()),
                  Gap(MAIN_SPACE),
                  NewItemSingleButtonView(params: NewItemSingleButtonParams()),
                  Gap(MAIN_SPACE),
                  NewItemColumnButton3View(
                      params: NewItemColumnButton3Params()),
                  Gap(MAIN_SPACE),
                  NewItemColumnButton2View(
                      params: NewItemColumnButton2Params()),
                  Gap(MAIN_SPACE),
                  NewItemColumnButton4View(
                      params: NewItemColumnButton4Params()),
                ],
              )
                  .padding(vertical: 20, horizontal: 20)
                  .backgroundColor(Theme.of(context).colorScheme.background),
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
